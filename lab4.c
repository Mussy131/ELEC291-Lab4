#include <EFM8LB1.h>
#include <stdio.h>
#include <stdint.h>
#include <math.h>


#define SYSCLK    72000000L // SYSCLK frequency in Hz
#define BAUDRATE    115200L // Baud rate of UART in bps

#define LCD_RS P1_7
// #define LCD_RW Px_x // Not used in this code.  Connect to GND
#define LCD_E  P2_0
#define LCD_D4 P1_3
#define LCD_D5 P1_2
#define LCD_D6 P1_1
#define LCD_D7 P1_0
#define CHARS_PER_LINE 16


#define PHASE_A P3_2
#define PHASE_B P3_3
#define PHASE_SIGN P3_7
#define VREF 1.65f

#define FREQ     1455.2f
#define OMEGA (2*PI*FREQ)
#define DIVISOR 5100.0f
#define OPEN_CIRCUIT_VOLTAGE 1.375f

#define Z_CAL 0.8f



char _c51_external_startup (void)
{
	// Disable Watchdog with 2-byte key sequence
	SFRPAGE = 0x00;
	WDTCN = 0xDE; //First key
	WDTCN = 0xAD; //Second key

	#if (SYSCLK == 48000000L)	
		SFRPAGE = 0x10;
		PFE0CN  = 0x10; // SYSCLK < 50 MHz.
		SFRPAGE = 0x00;
	#elif (SYSCLK == 72000000L)
		SFRPAGE = 0x10;
		PFE0CN  = 0x20; // SYSCLK < 75 MHz.
		SFRPAGE = 0x00;
	#endif
	
	#if (SYSCLK == 12250000L)
		CLKSEL = 0x10;
		CLKSEL = 0x10;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 24500000L)
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 48000000L)	
		// Before setting clock to 48 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x07;
		CLKSEL = 0x07;
		while ((CLKSEL & 0x80) == 0);
	#elif (SYSCLK == 72000000L)
		// Before setting clock to 72 MHz, must transition to 24.5 MHz first
		CLKSEL = 0x00;
		CLKSEL = 0x00;
		while ((CLKSEL & 0x80) == 0);
		CLKSEL = 0x03;
		CLKSEL = 0x03;
		while ((CLKSEL & 0x80) == 0);
	#else
		#error SYSCLK must be either 12250000L, 24500000L, 48000000L, or 72000000L
	#endif

	P0MDOUT |= 0x10; // Enable UART0 TX as push-pull output
	XBR0     = 0x01; // Enable UART0 on P0.4(TX) and P0.5(RX)                     
	XBR1     = 0X00;
	XBR2     = 0x40; // Enable crossbar and weak pull-ups

	#if (((SYSCLK/BAUDRATE)/(2L*12L))>0xFFL)
		#error Timer 0 reload value is incorrect because ((SYSCLK/BAUDRATE)/(2L*12L))>0xFF
	#endif
	// Configure Uart 0
	SCON0 = 0x10;
	CKCON0 |= 0b_0000_0000 ; // Timer 1 uses the system clock divided by 12.
	TH1 = 0x100-((SYSCLK/BAUDRATE)/(2L*12L));
	TL1 = TH1;      // Init Timer1
	TMOD &= ~0xf0;  // TMOD: timer 1 in 8-bit auto-reload
	TMOD |=  0x20;                       
	TR1 = 1; // START Timer1
	TI = 1;  // Indicate TX0 ready
	
	return 0;
}


// Uses Timer3 to delay <us> micro-seconds. 
void Timer3us(unsigned char us)
{
	unsigned char i;               // usec counter
	
	// The input for Timer 3 is selected as SYSCLK by setting T3ML (bit 6) of CKCON0:
	CKCON0|=0b_0100_0000;
	
	TMR3RL = (-(SYSCLK)/1000000L); // Set Timer3 to overflow in 1us.
	TMR3 = TMR3RL;                 // Initialize Timer3 for first overflow
	
	TMR3CN0 = 0x04;                 // Sart Timer3 and clear overflow flag
	for (i = 0; i < us; i++)       // Count <us> overflows
	{
		while (!(TMR3CN0 & 0x80));  // Wait for overflow
		TMR3CN0 &= ~(0x80);         // Clear overflow indicator
	}
	TMR3CN0 = 0 ;                   // Stop Timer3 and clear overflow flag
}

void waitms (unsigned int ms)
{
	unsigned int j;
	unsigned char k;
	for(j=0; j<ms; j++)
		for (k=0; k<4; k++) Timer3us(250);
}

void LCD_pulse (void)
{
	LCD_E=1;
	Timer3us(40);
	LCD_E=0;
}

void LCD_byte (unsigned char x)
{
	// The accumulator in the C8051Fxxx is bit addressable!
	ACC=x; //Send high nible
	LCD_D7=ACC_7;
	LCD_D6=ACC_6;
	LCD_D5=ACC_5;
	LCD_D4=ACC_4;
	LCD_pulse();
	Timer3us(40);
	ACC=x; //Send low nible
	LCD_D7=ACC_3;
	LCD_D6=ACC_2;
	LCD_D5=ACC_1;
	LCD_D4=ACC_0;
	LCD_pulse();
}

void WriteData (unsigned char x)
{
	LCD_RS=1;
	LCD_byte(x);
	waitms(2);
}

void WriteCommand (unsigned char x)
{
	LCD_RS=0;
	LCD_byte(x);
	waitms(5);
}

void LCD_4BIT (void)
{
	LCD_E=0; // Resting state of LCD's enable is zero
	// LCD_RW=0; // We are only writing to the LCD in this program
	waitms(20);
	// First make sure the LCD is in 8-bit mode and then change to 4-bit mode
	WriteCommand(0x33);
	WriteCommand(0x33);
	WriteCommand(0x32); // Change to 4-bit mode

	// Configure the LCD
	WriteCommand(0x28);
	WriteCommand(0x0c);
	WriteCommand(0x01); // Clear screen command (takes some time)
	waitms(20); // Wait for clear screen command to finsih.
}

void LCDprint(char * string, unsigned char line, bit clear)
{
	int j;

	WriteCommand(line==2?0xc0:0x80);
	waitms(5);
	for(j=0; string[j]!=0; j++)	WriteData(string[j]);// Write the message
	if(clear) for(; j<CHARS_PER_LINE; j++) WriteData(' '); // Clear the rest of the line
}

int getsn (char * buff, int len)
{
	int j;
	char c;
	
	for(j=0; j<(len-1); j++)
	{
		c=getchar();
		if ( (c=='\n') || (c=='\r') )
		{
			buff[j]=0;
			return j;
		}
		else
		{
			buff[j]=c;
		}
	}
	buff[j]=0;
	return len;
}

void ADC_Init(void)
{
	// Disable the ADC0
	//ADC0CN0 = 0x00; // Disable the ADC0

	// Select the ADC0 input as P2.6 (0.19)
	ADC0MX = QFP32_MUX_P2_6;

	// Set the ADC operates to 14-bits mode, and accumulate 4 times
	ADC0CN1 = 0x81; // Set ADC0 to 14-bit mode

	// Select the reference voltage for the ADC
	//ADC0CF2 = 0x1f; 
	REF0CN = 0x80; // Set Vref to use internal reference (2.4V)
	
	//Enable the ADC0
	ADC0CN0 = 0x80; // Enable the ADC0
}

 uint16_t ADC_Read(void)
{
	uint16_t ans;

	// Start an ADC conversion
	ADC0CN0 |= 0x10; // Start an ADC conversion

	// Wait for the conversion to be completed
	while ((ADC0CN0 & 0x20) == 0x00);
	ADC0CN0 &= ~0x20; // Clear the conversion complete flag

	ans = ADC0H;
	ans <<= 8;
	ans |= ADC0L;

	return ans;
}

void GPIO_Init(void)
{
	// Configure the GPIO for the rotary encoder
	PHASE_A = 1;
	PHASE_B = 1;
	PHASE_SIGN = 1;
	P3MDOUT = 0x00;
	P3MDIN = 0x8c;
}

//phase discriminator with xor logic. sample for 4096 times
uint16_t get_phase(void)
{
	uint16_t i;
	uint16_t phase = 0;
	for(i = 0; i < 4096; i++){
		phase += PHASE_A ^ PHASE_B;
	}
	return phase;
}


void main (void)
{
	char buff[17];
	uint16_t result;
	float idata voltage;
	float idata angle;
	float idata vr,vi;
	float idata cr,ci;
	float idata zr,zi;
	float capacitance;

	GPIO_Init();

	// Configure the LCD
	LCD_4BIT();
	ADC_Init();
	// Display something in the LCD
	LCDprint("LCD 4-bit test:", 1, 1);
	LCDprint("qwedqeee", 2, 1);
	while(1)
	{
		result = ADC_Read();

		voltage = (float)result * VREF / (4*16383.0f);
		/*
		if( voltage > VREF - 0.05f){
			sprintf(buff, "ZR: HiZ");
			LCDprint(buff, 1, 1);
			sprintf(buff, "ZI: HiZ");
			LCDprint(buff, 2, 1);
			continue;
		}*/
		angle= (float)get_phase() * PI / 4096.0f;
		if( PHASE_SIGN == 0) angle = -angle;


		vr = voltage * cosf(angle);
		vi = voltage * sinf(angle);

		//using complex voltage divisor to get the impedance
		cr = (OPEN_CIRCUIT_VOLTAGE - vr) / DIVISOR;
		ci = -vi / DIVISOR;

		//divide the complex voltage by the complex current to get the impedance
		zr = (vr * cr + vi * ci) / (cr * cr + ci * ci) * Z_CAL;
		zi = (vi * cr - vr * ci) / (cr * cr + ci * ci) * Z_CAL;



		sprintf(buff, "ZR: %.3f", zr);
		LCDprint(buff, 1, 1);
		// sprintf(buff, "V: %.4fV", voltage);
		// LCDprint(buff, 1, 1);
		/*
		sprintf(buff, "ZI: %.3f", zi);
		LCDprint(buff, 2, 1);*/
		if( zi > 0.0 ){
			sprintf(buff, "L: %.3fmH", zi / OMEGA * 1000.0f);
			LCDprint(buff, 2, 1);
		}else{
			
			capacitance = -1.0f / (zi * OMEGA) * 1000000.0f;
			if(capacitance < 0.0001f){
				capacitance = 0.0;
			}else if(capacitance < 0.020f){
				capacitance *= 0.85;
			}else if (capacitance > 0.30f)
			{
				capacitance *= 2.3;
			}
			
			sprintf(buff, "C: %.3fuF", capacitance);
			LCDprint(buff, 2, 1);
		}

		//printf("Type what you want to display in line 2 (16 char max): ");
		//printf("\n");
	}
}