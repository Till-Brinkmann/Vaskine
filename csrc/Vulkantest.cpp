#include <vulkan/vulkan.h>
#include "GLFW/glfw3.h"
#include <iostream>

#include "Vulkantest.h"

#define VKResult_Check(result, errormsg) if(result != VK_SUCCESS) {std::cout << errormsg; exit(-1);}

int main (int argc, char *argv[]) {
  glfw_init();
  GLFWwindow *window = glfwCreateWindow(1280, 720, "Vulkantest", NULL, NULL);

  VkInstance instance = vulkan_instance();

  VkPhysicalDevice device = vulkan_device(instance);

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

VkInstance vulkan_instance() {
  VkApplicationInfo appInfo = { VK_STRUCTURE_TYPE_APPLICATION_INFO };
  appInfo.pNext = NULL;
  appInfo.pApplicationName = "Vulkantest";
  appInfo.applicationVersion = VK_MAKE_VERSION(0, 0, 1);
  appInfo.pEngineName = "None";
  appInfo.engineVersion = VK_MAKE_VERSION(0, 0, 1);
  appInfo.apiVersion = VK_API_VERSION_1_2;

  const char *layers[] = { "VK_LAYER_LUNARG_standard_validation" };

  VkInstanceCreateInfo createInfo = { VK_STRUCTURE_TYPE_INSTANCE_CREATE_INFO };
  createInfo.pNext = NULL;
  createInfo.pApplicationInfo = &appInfo;
  createInfo.flags = 0;
  createInfo.enabledLayerCount = 1;
  createInfo.ppEnabledLayerNames = layers;
  createInfo.enabledExtensionCount = 0;
  createInfo.ppEnabledExtensionNames = NULL;

  VkInstance ret;
  VkResult r = vkCreateInstance(&createInfo, NULL, &ret);
  VKResult_Check(r, "Failed to create instance");

  return ret;
}

VkPhysicalDevice vulkan_device(VkInstance instance) {
  uint32_t count = 0;
  vkEnumeratePhysicalDevices(instance, &count, NULL);

  std::cout << "PhyDevCount: " << count << '\n';

  VkPhysicalDevice *devices = new VkPhysicalDevice[count];
  vkEnumeratePhysicalDevices(instance, &count, devices);

  return devices[0];
}