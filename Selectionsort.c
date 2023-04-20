#include <stdio.h>
#include <stdlib.h>
#include <string.h>

// gcc -o mm  -std=c99  Selectionsort.c ; ./mm

  void selectionSort(char *sil) {
    int n = 0, eax, ebx, ecx, edx, edi, dl, dil;
    
    eax = 0;            // Find length
  findLength:
    if(sil[eax] == 0) goto endLength; 
    eax++;
    goto findLength;
  endLength: 
    n = eax;   
    
    eax = 0;
  sortArray:
    edx = n;
    edx--;
    if(eax >= edx) goto endSort;
 
    ebx = eax;
    ecx = eax;
  innerLoop:
    if(ecx >= n) goto endInner;
    
    dl = sil[ecx]; 
        if (dl >= sil[ebx]) goto skipAssignment;
          ebx = ecx;                                // Put index of min element in ebx
        skipAssignment:
        
    ecx++;
    goto innerLoop;
  endInner:;
  
      
      dl   = sil[ebx]; // Swap the found minimum element with the first element
      dil  = sil[eax];
      sil[ebx] = dil;
      sil[eax] = dl;
  

    eax++;
    goto sortArray;
    endSort:;
  }
  
  
  
  void main() {
		char *X = "hello";
    char x[99];
    strcpy(x, X);
		selectionSort(x);
		for(int eax = 0; eax < 5; eax++)  printf("%c\n", x[eax]);
 }
