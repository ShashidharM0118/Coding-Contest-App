#include<stdio.h>

void main()
{
	int a;
	scanf("%d", &a);

	int ans;

	for(int i = 2; i <= a; i++) {
		if(a % i == 0){
		  ans = a / i;
		  break;
		}
			
	}
	printf("%d", ans);
}
