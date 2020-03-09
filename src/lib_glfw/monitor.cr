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

# Monitor functions and types.

require "./lib"

lib LibGLFW
  # Opaque monitor object.
  type Monitor = Void

  # The function signature for monitor configuration callbacks.
  alias Monitorfun = (Monitor*, Int32 -> Void)

  # Describes a single video mode.
  struct VidMode
    # The width, in screen coordinates, of the video mode.
    width : Int32

    # The height, in screen coordinates, of the video mode.
    height : Int32

    # The bit depth of the red channel of the video mode.
    redBits : Int32

    # The bit depth of the green channel of the video mode.
    greenBits : Int32

    # The bit depth of the blue channel of the video mode.
    blueBits : Int32

    # The refresh rate, in Hz, of the video mode.
    refreshRate : Int32
  end

  # Describes the gamma ramp for a monitor.
  struct GammaRamp
    # An array of values describing the response of the red channel.
    red : UInt16*

    # An array of values describing the response of the green channel.
    green : UInt16*

    # An array of values describing the response of the blue channel.
    blue : UInt16*

    # The number of elements in each array.
    size : UInt32
  end

  # Retrieves the currently connected monitors.
  #
  # This method retrieves an array of handles for all currently connected monitors. The primary monitor
  # is always first in the returned array. If no monitors are found, *nil* is returned.
  #
  # This method accepts the following arguments:
  # - *count*, where it stores the number of monitors in the returned array.
  #
  # *count* is set to zero if an error occurs.
  #
  # Returns an array of monitor handles, or *nil* if no monitors were found or if an error occurred.
  @[Raises]
  fun get_monitors = glfwGetMonitors(count : Int32*) : Monitor**

  # Returns the primary monitor.
  #
  # This method returns the primary monitor. This is usually the monitor where elements like the task bar or
  # global menu bar are located.
  #
  # Returns the primary monitor handle or *nil* if no monitors were found or if an error occurred.
  @[Raises]
  fun get_primary_monitor = glfwGetPrimaryMonitor : Monitor*

  # Retrieves the position of the monitor's viewport on the virtual screen.
  #
  # This method retrieves the position, in screen coordinates, of the upper-left corner of the specified
  # monitor.
  #
  # Any or all of the position arguments may be *nil*. If an error occurs, all non-*nil* position arguments
  # will be set to zero.
  #
  # This method accepts the following arguments:
  # - *monitor*, the monitor to query.
  # - *xpos*, where to store the monitor x-coordinate, or nil.
  # - *ypos*, where to store the monitor y-coordinate, or nil.
  @[Raises]
  fun get_monitor_pos = glfwGetMonitorPos(monitor : Monitor*,
                                          xpos : Int32*,
                                          ypos : Int32*)

  # This function returns the position, in screen coordinates, of the upper-left corner of the work
  # area of the specified monitor along with the work area size in screen coordinates. The work area
  # is defined as the area of the monitor not occluded by the operating system task bar where
  # present. If no task bar exists then the work area is the monitor resolution in screen
  # coordinates.
  #
  # Any or all of the position and size arguments may be nil. If an error occurs, all non-nil
  # position and size arguments will be set to zero.
  #
  # This method accepts the following arguments:
  # - *monitor*, the monitor to query.
  # - *xpos*, where to store the monitor x-coordinate, or nil.
  # - *ypos*, where to store the monitor y-coordinate, or nil.
  # - *width*, where to store the monitor width, or nil.
  # - *height*, where to store the monitor height, or nil.
  #
  # Possible errors include GLFW_NOT_INITIALIZED and GLFW_PLATFORM_ERROR.
  @[Raises]
  fun get_monitor_workarea = glfwGetMonitorWorkarea(monitor : Monitor*,
                                                    xpos : Int32*,
                                                    ypos : Int32*,
                                                    width : Int32*,
                                                    height : Int32*)

  # Returns the physical size of the monitor.
  #
  # This method returns the size, in millimeters, of the display area of the specified monitor.
  #
  # Some systems do not provide accurate monitor size information, either because the monitor EDID data is
  # incorrect or because the driver does not report it accurately.
  #
  # Any or all of the size arguments may be *nil*. If an error occurs, all non-*nil* size arguments will be
  # set to zero.
  #
  # This method accepts the following arguments:
  # - *monitor*, the monitor to query.
  # - *widthMM*, where to store the width, in millimeters, of the monitor's display area, or *nil*.
  # - *heightMM*, where to store the height, in millimeters, of the monitor's display area, or *nil*.
  @[Raises]
  fun get_monitor_physical_size = glfwGetMonitorPhysicalSize(monitor : Monitor*,
                                                             widthMM : Int32*,
                                                             heightMM : Int32*)

  # This function retrieves the content scale for the specified monitor. The content scale is the
  # ratio between the current DPI and the platform's default DPI. This is especially important for
  # text and any UI elements. If the pixel dimensions of your UI scaled by this look appropriate on
  # your machine then it should appear at a reasonable size on other machines regardless of their
  # DPI and scaling settings. This relies on the system DPI and scaling settings being somewhat
  # correct.
  #
  # The content scale may depend on both the monitor resolution and pixel density and on user
  # settings. It may be very different from the raw DPI calculated from the physical size and
  # current resolution.
  #
  # Parameters
  # - *monitor*, the monitor to query.
  # - *xscale*, where to store the x-axis content scale, or nil.
  # - *yscale*, where to store the y-axis content scale, or nil.
  #
  # Possible errors include NOT_INITIALIZED and PLATFORM_ERROR.
  @[Raises]
  fun get_monitor_content_scale = glfwGetMonitorContentScale(monitor : Monitor*,
                                                             xscale : Float32*,
                                                             yscale : Float32*)

  # Returns the name of the specified monitor.
  #
  # This method returns a human-readable name of the specified monitor. The name typically reflects the make
  # and model of the monitor and is not guaranteed to be unique among the connected monitors.
  #
  # This method accepts the following arguments:
  # - *monitor*, the monitor to query.
  #
  # Returns the name of the monitor, or *nil* if an error occurs.
  @[Raises]
  fun get_monitor_name = glfwGetMonitorName(monitor : Monitor*) : UInt8*

  # This function sets the user-defined pointer of the specified monitor. The current value is
  # retained until the monitor is disconnected. The initial value is NULL.
  #
  # This function may be called from the monitor callback, even for a monitor that is being
  # disconnected.
  #
  # This method accepts the following arguments:
  # - *monitor*, the monitor whose pointer to set.
  # - *pointer*, the new value.
  #
  # Possible errors include NOT_INITIALIZED.
  @[Raises]
  fun set_monitor_user_pointer = glfwSetMonitorUserPointer(monitor : Monitor*, pointer : Void*)

  # This function returns the current value of the user-defined pointer of the specified monitor.
  # The initial value is nil.
  #
  # This function may be called from the monitor callback, even for a monitor that is being
  # disconnected.
  #
  # This method accepts the following arguments:
  # - *monitor*, the monitor whose pointer to return.
  #
  # Possible errors include NOT_INITIALIZED.
  @[Raises]
  fun get_monitor_user_pointer = glfwGetMonitorUserPointer(monitor : Monitor*) : Void*

  # Sets the monitor configuration callback.
  #
  # This method sets the monitor configuration callback, or removes the currently set callback. This is called
  # when a monitor is connected to or disconnected from the system.
  #
  # This method accepts the following arguments:
  # - *cbfun*, the new callback, or *nil* to remove the currently set callback.
  #
  # Returns the previously set callback, or *nil* if no callback is set or the library has not been
  # initialized.
  @[Raises]
  fun set_monitor_callback = glfwSetMonitorCallback(cbfun : Monitorfun) : Monitorfun

  # Returns the available video modes for the specified monitor.
  #
  # This method returns an array of all video modes supported by the monitor. The returned array is sorted in
  # ascending order, first by color bit depth (the sum of all channel depths) and then by resolution area (the
  # product of width and height).
  #
  # This method accepts the following arguments:
  # - *monitor*, the monitor to query.
  # - *count*, where to store the number of video modes in the returned array. This is set to zero if an error occurs.
  #
  # Returns an array of video modes, or *nil* if an error occurs.
  @[Raises]
  fun get_video_modes = glfwGetVideoModes(monitor : Monitor*,
                                          count : Int32*) : VidMode*

  # Returns the current mode of the specified monitor.
  #
  # This method returns the current video mode of the specified monitor. If a full screen window has been created for
  # that monitor, the return value will depend on whether that window is iconified.
  #
  # This method accepts the following arguments:
  # - *monitor*, the monitor to query.
  #
  # Returns the current mode of the monitor, or *nil* if an error occurs.
  @[Raises]
  fun get_video_mode = glfwGetVideoMode(monitor : Monitor*) : VidMode*

  # Generates a gamma ramp and sets it for the specified monitor.
  #
  # This method generates a 256-element gamma ramp from the specified exponent and then calls `#set_gamma_ramp` with it.
  # The value must be a finite number greater than zero.
  #
  # This method accepts the following arguments:
  # - *monitor*, the monitor whose gamma ramp to set.
  # - *gamma*, the desired exponent.
  @[Raises]
  fun set_gamma = glfwSetGamma(monitor : Monitor*,
                               gamma : Float32)

  # Returns the current gamma ramp for the specified monitor.
  @[Raises]
  fun get_gamma_ramp = glfwGetGammaRamp(monitor : Monitor*) : GammaRamp*

  # Sets the current gamma ramp for the specified monitor.
  @[Raises]
  fun set_gamma_ramp = glfwSetGammaRamp(monitor : Monitor*,
                                        ramp : GammaRamp*)
end
