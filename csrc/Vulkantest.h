int main (int argc, char *argv[]);

void glfw_init();

VkInstance vulkan_instance();

VkPhysicalDevice vulkan_device(VkInstance instance);