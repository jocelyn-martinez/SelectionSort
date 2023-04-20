;  Week 14 day 1 Exercise: Bubble Sort!
;
;  Jocelyn Martinez
;  April 2023


.586
.MODEL FLAT

INCLUDE io.h            ; header file for input/output

.STACK 4096

.DATA
array                BYTE  "hello world", 0
n                    DWORD ?
prompt1              BYTE  "Unsorted List", 0
prompt2              BYTE  "Sorted List", 0

.CODE
_MainProc PROC

;***  Print the original, unsorted string
 
        ; Now output the string.
outputstring:
        output  prompt1, array

;*** Now launch into the Selection Sort ********************************************************************************
    
  mov eax,  0;            ; Find length
  lea esi, array
findLength:
    mov bl, [esi+eax]
    cmp bl, 0
    je endLength

    inc eax
    jmp findLength
 endLength: 
    mov n, eax
    mov eax, 0
 sortArray:
    mov ebx, n
    dec ebx
    cmp eax, ebx
    jge endSort
    
    mov ebx, eax
    mov ecx, eax

  innerLoop:
    cmp ecx, n
    jge endInner

    mov dl, [esi + ecx]
    cmp dl, [esi + ebx]
    jge skipAssignment
    mov ebx, ecx                ; Put index of min element in ebx
                               
  skipAssignment:
        
    inc ecx
    jmp innerLoop
  endInner:
    
    mov dl,  [esi + ebx] ; Swap the found minimum element with the first element
    push ecx
    mov cl, [esi + eax]
    mov [esi + ebx], cl
    pop ecx
    mov [esi + eax], dl
  
    inc eax
    jmp sortArray
    endSort:
;***  Print the new sorted list

        ; Now output the string.
outputsortstring:
        output  prompt2, array

        mov     eax, 0  ; exit with return code 0
        ret
_MainProc ENDP
END                             ; end of source code
