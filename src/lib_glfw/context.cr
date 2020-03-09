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

# Context functions and types.

require "./lib"

lib LibGLFW
  # Client API function pointer type.
  type GlProc = (Void -> Void)

  # Makes the context of the specified window current for the calling thread.
  @[Raises]
  fun make_context_current = glfwMakeContextCurrent(window : Window*)

  # Returns the window whose context is current on the calling thread.
  @[Raises]
  fun get_current_context = glfwGetCurrentContext : Window*

  # Sets the swap interval for the current context.
  @[Raises]
  fun swap_interval = glfwSwapInterval(interval : Int32)

  # Returns whether the specified extension is available.
  @[Raises]
  fun extension_supported = glfwExtensionSupported(extension : UInt8*) : Int32

  # Returns the address of the specified function for the current context
  @[Raises]
  fun get_proc_address = glfwGetProcAddress(procname : UInt8*) : GlProc
end
