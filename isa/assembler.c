#include <stdio.h>
#include <stdlib.h>
#include <string.h>

typedef enum {
  ADD = 0,
  LSH = 1,
  RA1 = 2,
  RA2 = 3,
  B00 = 4,
  B01 = 5,
  B02 = 6,
  B03 = 7
} instructions;

instructions instruction_to_machine(const char *instr){

  if(strcmp(instr, "ADD") == 0) return ADD;
  if(strcmp(instr, "LSH") == 0) return LSH;
  if(strcmp(instr, "RA1") == 0) return RA1;
  if(strcmp(instr, "RA2") == 0) return RA2;
  if(strcmp(instr, "0") == 0) return B00;
  if(strcmp(instr, "1") == 0) return B01;
  if(strcmp(instr, "2") == 0) return B02;
  if(strcmp(instr, "3") == 0) return B03;

}

void txt_to_bin(FILE *fptr){
  FILE *fptr_b = fopen("binary_instr.bin", "wb");
  

}


int main(void){
  
  FILE *fptr = fopen("isa.txt", "r");

  if(fptr == NULL){
    printf("File was not opened.\n");
    exit(1);
  } 

  char *instr = (char*) malloc(4 * sizeof(char));

  char letter;
  FILE *fptr_mc = fopen("machine_code.txt", "w");
  int count = 0;

  while((letter = fgetc(fptr)) != EOF){
    *(instr + count) = letter; 
  
    if(*(instr + count) == ' ' || *(instr + count) == '\n'){
      *(instr + count) = '\0';
      printf("%s\n", instr);
      count = 0;
      instructions code = instruction_to_machine(instr);

      switch (code) {   
        case ADD: fprintf(fptr_mc,"0");
        break;
        case LSH: fprintf(fptr_mc,"1");
        break;
        case RA1: fprintf(fptr_mc,"0");
        break;
        case RA2: fprintf(fptr_mc,"1");
        break;
        case B00: fprintf(fptr_mc, "00");
        break;
        case B01: fprintf(fptr_mc, "01");
        break;
        case B02: fprintf(fptr_mc, "10");
        break;
        case B03: fprintf(fptr_mc, "11");
        break;
          
      }
    } else {
      count++;
    }

    

  }



  free(instr);
  fclose(fptr_mc);
  fclose(fptr);

  return 0;
}
