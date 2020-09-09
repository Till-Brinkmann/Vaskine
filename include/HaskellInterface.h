/*
 * HaskellInterface.h
 *
 *  Created on: 25.05.2020
 *      Author: Till_2
 */

#ifndef HASKELLINTERFACE_H_
#define HASKELLINTERFACE_H_

#include <string>
extern "C" {
  int getACoolNumber();
  int getACoolNumberFor(std::string name);

  void printCoolStuff();
}

#endif /* HASKELLINTERFACE_H_ */
