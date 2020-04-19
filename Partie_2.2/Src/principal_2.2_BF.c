extern int dft(int,short*);
extern short TabSig[];

int M2k[64];

int main(void)
{
	for(int k=0;k<64;k++)
	{
		M2k[k]=dft(k,TabSig);
	}
	
	while	(1)
	{
	}
}
