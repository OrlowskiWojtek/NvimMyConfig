#include <stdio.h>
#include <iostream>

int main (int argc, char *argv[]) {
  std::cout << "Siema to ja pisze z cout" << std::endl;  
  fprintf(stderr, "Siema to ja pisze jakiś kod\n");
  return 0;
}

