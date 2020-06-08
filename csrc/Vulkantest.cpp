#include <vulkan/vulkan.h>
#include "GLFW/glfw3.h"
#include <iostream>

int main (int argc, char *argv[]) {
  if (!glfwInit()) {
    std::cout << "GLFW init failed";
    return -1;
  }

  GLFWwindow *window = glfwCreateWindow(1280, 720, "Vulkantest", NULL, NULL);

  while (!glfwWindowShouldClose(window))
  {
    glfwPollEvents();
  }

  glfwDestroyWindow(window);

  return 0;
}
