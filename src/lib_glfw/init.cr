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

# Initialization, version, and error functions and types.

require "./lib"

lib LibGLFW
  # Constants:

  # One, or true.
  #
  # This is only semantic sugar for the number 1.
  TRUE = 1

  # Zero, or false.
  #
  # This is only semantic sugar for the number 0.
  FALSE = 0

  # Joystick hat buttons init hint.
  JOYSTICK_HAT_BUTTONS = 0x00050001

  # macOS specific init hint.
  COCOA_CHDIR_RESOURCES = 0x00051001

  # macOS specific init hint.
  COCOA_MENUBAR = 0x00051002

  # Types:

  # The function signature for error callbacks.
  alias ErrorFun = (Int32, UInt8* -> Void)

  # Functions:

  # Initializes the GLFW library.
  #
  # Before most GLFW functions can be used, GLFW must be initialized, and before an application
  # terminates, GLFW should be terminated in order to free any resources allocated during or after
  # initialization.
  #
  # If this method fails, it calls `#terminate` before returning. If this method succeeds, `#terminate`
  #  should be called manually before the application exits.
  #
  # Additional calls to this method after successful initialization but before termination will immediately
  # return `GLFW_TRUE`.
  #
  # Returns `GLFW_TRUE` if initialization is successful and returns `GLFW_FALSE` otherwise.
  fun init = glfwInit : Int32

  # Terminates the GLFW Library.
  #
  # This method destroys all remaining windows and cursors, restores any modified gamma ramps and frees
  # any other allocated resources.  Once it is called, initialization via `#init` will be necessary to
  # begin using most GLFW functions again.
  #
  # If GLFW has been successfully initialized, this method should be called before the application exits.
  # If initialization fails, there is no need to call this method, because `#init` calls it implicity upon
  # failure.
  fun terminate = glfwTerminate

  # This function sets hints for the next initialization of GLFW.
  #
  # The values you set hints to are never reset by GLFW, but they only take effect during
  # initialization. Once GLFW has been initialized, any values you set will be ignored until the
  # library is terminated and initialized again.
  #
  # Some hints are platform specific. These may be set on any platform but they will only affect
  # their specific platform. Other platforms will ignore them. Setting these hints requires no
  # platform specific headers or functions.
  #
  # It accepts the following arguments:
  # - *hint*, the init hint to set.
  # - *value*, the new value of the init hint.
  #
  # Possible errors include INVALID_ENUM and INVALID_VALUE.
  @[Raises]
  fun init_hint = glfwInitHint(hint : Int32, value : Int32)

  # Retrieves the version of the GLFW library.
  #
  # This method retrieves the major, minor, and revision numbers of the GLFW library.
  #
  # It accepts the following arguments:
  # - *major*, where to store the major version number.
  # - *minor*, where to store the minor version number.
  # - *rev*, where to store the revision version number.
  fun get_version = glfwGetVersion(major : Int32*,
                                   minor : Int32*,
                                   rev : Int32*)

  # Returns the compile-time generated version string of the GLFW library binary.
  #
  # This method describes the version, platform, compiler, and any platform-specific compile-time
  # options. The format of the string is as follows:
  #
  # - The version of GLFW
  # - The name of the window system API
  # - The name of the context creation api
  # - Any additional options or APIs
  #
  # **The version string should not be used to parse the GLFW library version.** `#get_version` provides the
  # version of the running library binary in numerical format.
  fun get_version_string = glfwGetVersionString : UInt8*

  # This function returns and clears the error code of the last error that occurred on the calling
  # thread, and optionally a UTF-8 encoded human-readable description of it. If no error has
  # occurred since the last call, it returns NO_ERROR (zero) and the description pointer is set to
  # nil.
  #
  # This method accepts the following arguments:
  # - *description*, where to store the error description pointer, or nil.
  fun get_error = glfwGetError(description : UInt8**) : Int32

  # Sets the error callback, which is called with an error code and a human-readable description each time a GLFW
  # error occurs.
  #
  # The error callback is called on the thread where the error occurred. If GLFW is being used from multiple
  # threads, then the error callback needs to be written accordingly.
  #
  # Because the description string may have been generated specifically for that error, it is not guaranteed
  # to be valid after the callback has returned.  A copy of the description string must be made if it is to
  # be used after the callback returns.
  #
  # Once set, the error callback remains set even after the library has been terminated.
  #
  # This method accepts the following arguments:
  # - *cbfun*, the new callback. If nil, the current callback is removed.
  #
  # Returns the previously set callback or *nil* if no callback was set.
  fun set_error_callback = glfwSetErrorCallback(cbfun : ErrorFun) : ErrorFun
end
