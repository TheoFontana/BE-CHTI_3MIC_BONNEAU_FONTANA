#include "gassp72.h"
#include "etat.h"

#define Periode_PWM_en_Tck 720


void timer_callback(void);

extern int LongueurSon;
extern int PeriodeSonMicroSec;
extern short Son[];

type_etat etat;


int main(void)
{
	// config port PB0 pour être utilisé par TIM3-CH3
	GPIO_Configure(GPIOB, 0, OUTPUT, ALT_PPULL);
	// config TIM3-CH3 en mode PWM
	etat.resolution = PWM_Init_ff( TIM3, 3, Periode_PWM_en_Tck );
	etat.taille = LongueurSon;
	etat.periode_ticks = PeriodeSonMicroSec*72;
	etat.son = Son;
	etat.position =0;
	
	
	
	// activation de la PLL qui multiplie la fréquence du quartz par 9
	CLOCK_Configure();
	// initialisation du timer 4
	// Periode_en_Tck doit fournir la durée entre interruptions,
	// exprimée en périodes Tck de l'horloge principale du STM32 (72 MHz)
	Timer_1234_Init_ff( TIM4, etat.periode_ticks );
	// enregistrement de la fonction de traitement de l'interruption timer
	// ici le 2 est la priorité, timer_callback est l'adresse de cette fonction, a créér en asm,
	// cette fonction doit être conforme à l'AAPCS
	Active_IT_Debordement_Timer( TIM4, 2, timer_callback );
	// lancement du timer
	Run_Timer( TIM4 );
		
	while	(1){}
}
