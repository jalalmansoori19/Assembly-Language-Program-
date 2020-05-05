#include <iostream>
#include <stdlib.h>
using namespace std;

//Functions Declaration
bool isPalindrome(int fibo);

int main()
{
	int previous=1, nextTerm=0;
	int fibo=0, sNo=1;
	int binary=1;
	int result=1;
	
	int num=0;
		
	cout<<"\t\t\t\t\tFiboPalindrome\n\n";
	
	cout<<"This Program will Find Numbers Which are Part of Fibonacci Series and are also Palindrome.\n";
	
	cout<<"\nFibonacci Series:\n";
	cout<<"\nIt is a series of numbers in which each number is the sum of the two preceding numbers.\n";
	cout<<"The Simplest is the Series 1,1,2,3,5,8...etc\n";
	
	cout<<"\nPalindromic Number:\n";
	cout<<"\nA Number that is Same written Forwards or Backwards.\n";
	cout<<"e.g 0,1,2,3,4,5,6,7,8,9,11,22,33,44...etc\n\n\n";
	
	cout<<"Enter Positive Integer : ";
	cin>>num;
	
	cout<<"\n";
	
	if(num >= 1)
	{
		cout<<"sNo"<<"\t"<<"Fibonacci"<<"\t"<<"Palindrome"<<endl;
		cout<<sNo<<"\t"<<previous<<"\t\t"<<binary<<endl;
		for(int counter=1; counter<num; counter++)
		{
			sNo++;
			
			fibo=previous+nextTerm;
			
			if(isPalindrome(fibo) == 1)
			{
				result++;
				cout<<sNo<<"\t"<<fibo<<"\t\t"<<binary<<endl;
			}	
			else
			{
				cout<<sNo<<"\t"<<fibo<<"\t\t"<<binary-1<<endl;				
			}
			nextTerm=previous;
			
			previous=fibo;
		}
	}
	else
	{
		cout<<"Invalid Number!";
	}
	
	if(num>=1)
	{
		cout<<"\n\nResult:\n\n";
		cout<<"There are "<<result<<" FiboPalindrome Numbers.";
	}
	
	return 0;
}

bool isPalindrome(int fibo)
{
	int remainder=0;
	int reverse=0;
	
	int temp=fibo;
	
	while(fibo!=0)
	{
		remainder=fibo%10;
		
		reverse=(reverse*10)+remainder;
		
		fibo=fibo/10;
	}
	
	if(temp == reverse)
	{
		return 1;
	}
	return 0;
}
