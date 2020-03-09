# Copyright (c) 2017 Caleb Uriah Harrison.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Vulkan functions and types.

require "./lib"

lib LibGLFW
  # Types:

  # Vulkan API function pointer type.
  type VkProc = (Void -> Void)

  # Opaque VkInstance object.
  type VkInstance = Void

  # Opaque VkPhysicalDevice object.
  type VkPhysicalDevice = Void

  # Opaque VkAllocationCallbacks object.
  type VkAllocationCallbacks = Void

  # Opaque VkSurfaceKHR object.
  type VkSurfaceKHR = Void

  # Opaque VkResult object.
  type VkResult = Void

  # Functions:

  # Returns whether the Vulkan loader has been found.
  @[Raises]
  fun vulkan_supported = glfwVulkanSupported : Int32

  # Returns the Vulkan instance extensions required by GLFW.
  @[Raises]
  fun get_required_instance_extensions = glfwGetRequiredInstanceExtensions(count : UInt32*) : UInt8**

  # Returns the address of the specified Vulkan instance function.
  @[Raises]
  fun get_instance_proc_address = glfwGetInstanceProcAddress(instance : VkInstance*,
                                                             procname : UInt8*) : VkProc

  # Returns whether the specified queue family can present images.
  @[Raises]
  fun get_physical_device_presentation_support = glfwGetPhysicalDevicePresentationSupport(instance : VkInstance*,
                                                                                          device : VkPhysicalDevice*,
                                                                                          queuefamily : UInt32) : Int32

  # Creates a Vulkan surface for the specified window
  @[Raises]
  fun create_window_surface = glfwCreateWindowSurface(instance : VkInstance*,
                                                      window : Window*,
                                                      allocator : VkAllocationCallbacks*,
                                                      surface : VkSurfaceKHR*) : VkResult*
end
