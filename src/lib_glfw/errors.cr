# Copyright (c) 2017 Caleb Uriah Harrison.
# Copyright (c) 2020 Noel Cower.
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

# Error constants.

require "./lib"

lib LibGLFW
  # No error has occurred.
  NO_ERROR = 0

  # GLFW has not been initialized.
  NOT_INITIALIZED     = 0x00010001

  # No context is current for this thread.
  NO_CURRENT_CONTEXT  = 0x00010002

  # One of the arguments to the function was an invalid enum value.
  INVALID_ENUM        = 0x00010003

  # One of the arguments to the function was an invalid value.
  INVALID_VALUE       = 0x00010004

  # A memory allocation failed.
  OUT_OF_MEMORY       = 0x00010005

  # GLFW could not find support for the requested API on the system.
  API_UNAVAILABLE     = 0x00010006

  # The requested OpenGL or OpenGL ES version is not available.
  VERSION_UNAVAILABLE = 0x00010007

  # A platform-specific error occurred that does not match any of the more specific categories.
  PLATFORM_ERROR      = 0x00010008

  # The requested format is not supported or available.
  FORMAT_UNAVAILABLE  = 0x00010009

  # The specified window does not have an OpenGL or OpenGL ES context.
  NO_WINDOW_CONTEXT   = 0x0001000A
end
