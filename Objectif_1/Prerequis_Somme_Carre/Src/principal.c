extern int somme_carre_trigo(int);

int main(void)
{
	int min = somme_carre_trigo(0);
	int max = min;
	int somme;
	
	for (int angle =1; angle<64; ++angle)
	{
		somme = somme_carre_trigo(angle);
		if (somme>max)
			max = somme;
		else if (somme<min)
			min = somme;
	}
	
	while	(1)
	{
	}
}
