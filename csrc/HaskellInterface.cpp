/*
 * HaskellInterface.cpp
 *
 *  Created on: 25.05.2020
 *      Author: Till_2
 */
#include "../include/HaskellInterface.h" //TODO ma gucken

#include <iostream>

extern "C" {
  int getACoolNumber() {
    return 42;
  }
  int getACoolNumberFor(std::string name) {
    std::cout << "Generating a number for " << name;
    return rand();
  }

  void printCoolStuff() {
    std::cout << "This is a print called from Haskell";
  }
}
