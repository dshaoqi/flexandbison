#include <stdlib.h>
struct test {
	int a;
};

int main(){
	struct test *a=(struct test*)malloc(sizeof(struct test));
	a->a=1;
	return 0;
}
