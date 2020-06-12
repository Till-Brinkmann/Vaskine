#include <vulkan/vulkan.h>
#include "GLFW/glfw3.h"
#include <iostream>

#include "Vulkantest.h"

int main (int argc, char *argv[]) {
  glfw_init();
  GLFWwindow *window = glfwCreateWindow(1280, 720, "Vulkantest", NULL, NULL);

  vulkan_init();

  while (!glfwWindowShouldClose(window))
  {
    glfwPollEvents();
  }

  glfwDestroyWindow(window);

  return 0;
}

void glfw_init() {
  if (!glfwInit()) {
    std::cout << "GLFW init failed";
    exit(-1);
  }
}

void vulkan_init() {

}
