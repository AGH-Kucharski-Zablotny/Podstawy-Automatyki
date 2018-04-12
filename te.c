#include <stdio.h>
#include <unistd.h>

int main(void)
{



fork();
if( exec("ls") )
		printf("A");
}
