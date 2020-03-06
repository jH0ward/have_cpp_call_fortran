#include <iostream>
using namespace std;
extern"C" {
void fortfunc_(int * ii, float * ff, int abc[3]);
}
int main()
{
int ii=5;
float ff=5.5;
int abc[3] = {1,2,3};
cout << "hello before " << endl;
fortfunc_(&ii,&ff,abc);
cout << "abc after fortran" << endl;
cout << abc[0] << endl;;
cout << abc[1] << endl;;
cout << abc[2] << endl;;
return 0;
}
