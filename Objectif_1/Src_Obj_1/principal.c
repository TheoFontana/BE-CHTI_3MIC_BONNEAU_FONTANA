extern int dft(short*,int);
extern short TabSig1[];


int main(void)
{
	int M2k[64];
	for(int k=0;k<64;k++)
	{
		M2k[k]=dft(TabSig1,k);
	}
	
	while	(1)
	{
	}
}
