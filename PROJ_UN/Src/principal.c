#include "gassp72.h"

void timer_callback(void) ;


int main(void)
{
	TIM_TypeDef * TIM_4 ;
	int Periode_en_Tck ;

	// activation de la PLL qui multiplie la fréquence du quartz par 9
CLOCK_Configure();
// config port PB1 pour être utilisé en sortie
GPIO_Configure(GPIOB, 1, OUTPUT, OUTPUT_PPULL);
// initialisation du timer 4
// Periode_en_Tck doit fournir la durée entre interruptions,
// exprimée en périodes Tck de l'horloge principale du STM32 (72 MHz)
Timer_1234_Init_ff( TIM_4, Periode_en_Tck );
// enregistrement de la fonction de traitement de l'interruption timer
// ici le 2 est la priorité, timer_callback est l'adresse de cette fonction, a créér en asm,
// cette fonction doit être conforme à l'AAPCS
Active_IT_Debordement_Timer( TIM_4, 2, timer_callback );
// lancement du timer
Run_Timer( TIM_4 );
	
while	(1)
	{
	}
}
