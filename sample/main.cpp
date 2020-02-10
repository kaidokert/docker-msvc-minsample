#include <iostream>

#ifndef BUILD_DRIVER
#define BUILD_DRIVER "MSBuild"
#endif

int main() {
   std::cout << "Hello, from " BUILD_DRIVER "!\n";
   return 0;
}
