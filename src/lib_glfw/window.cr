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

# Window functions, types, and constants.

require "./lib"

lib LibGLFW
  # Types:

  # Opaque window object.
  type Window = Void

  # Describes an image.
  struct Image
    # The width, in pixels, of this image.
    width : Int32

    # The height, in pixels, of this image.
    height : Int32

    # The pixel data of this image, arranged left-to-right, top-to-bottom.
    pixels : UInt8*
  end

  # The function signature for window position callbacks.
  alias Windowposfun = (Window*, Int32, Int32 -> Void)

  # The function signature for window resize callbacks.
  alias Windowsizefun = (Window*, Int32, Int32 -> Void)

  # The function signature for window close callbacks.
  alias Windowclosefun = (Window* -> Void)

  # The function signature for window content refresh callbacks.
  alias Windowrefreshfun = (Window* -> Void)

  # The function signature for window focus/defocus callbacks.
  alias Windowfocusfun = (Window*, Int32 -> Void)

  # The function signature for window iconify/restore callbacks.
  alias Windowiconifyfun = (Window*, Int32 -> Void)

  # The function signature for window maximize callbacks.
  alias Windowmaximizefun = (Window*, Int32 -> Void)

  # The function signature for framebuffer resize callbacks.
  alias Framebuffersizefun = (Window*, Int32, Int32 -> Void)

  # The function signature for window content scale callbacks.
  alias Windowcontentscalefun = (Window*, Float32, Float32 -> Void)

  # Constants:

  # Input focus window hint and attribute.
  FOCUSED = 0x00020001
  # Window iconification window attribute.
  ICONIFIED = 0x00020002
  # Window resize-ability window hint and attribute.
  RESIZABLE = 0x00020003
  # Window visibility window hint and attribute.
  VISIBLE = 0x00020004
  # Window decoration window hint and attribute.
  DECORATED = 0x00020005
  # Window auto-iconification window hint and attribute.
  AUTO_ICONIFY = 0x00020006
  # Window decoration window hint and attribute.
  FLOATING = 0x00020007
  # Window maximization window hint and attribute.
  MAXIMIZED = 0x00020008
  # Cursor centering window hint.
  CENTER_CURSOR = 0x00020009
  # Window framebuffer transparency hint and attribute.
  TRANSPARENT_FRAMEBUFFER = 0x0002000A
  # Framebuffer bit depth hint.
  RED_BITS = 0x00021001
  # Framebuffer bit depth hint.
  GREEN_BITS = 0x00021002
  # Framebuffer bit depth hint.
  BLUE_BITS = 0x00021003
  # Framebuffer bit depth hint.
  ALPHA_BITS = 0x00021004
  # Framebuffer bit depth hint.
  DEPTH_BITS = 0x00021005
  # Framebuffer bit depth hint.
  STENCIL_BITS = 0x00021006
  # Framebuffer bit depth hint.
  ACCUM_RED_BITS = 0x00021007
  # Framebuffer bit depth hint.
  ACCUM_GREEN_BITS = 0x00021008
  # Framebuffer bit depth hint.
  ACCUM_BLUE_BITS = 0x00021009
  # Framebuffer bit depth hint.
  ACCUM_ALPHA_BITS = 0x0002100A
  # Framebuffer auxilliary buffer hint.
  AUX_BUFFERS = 0x0002100B
  # OpenGL stereoscopic rendering hint.
  STEREO = 0x0002100C
  # Framebuffer MSAA samples hint.
  SAMPLES = 0x0002100D
  # Framebuffer sRGB hint.
  SRGB_CAPABLE = 0x0002100E
  # Monitor refresh rate hint.
  REFRESH_RATE = 0x0002100F
  # Framebuffer double buffering hint.
  DOUBLEBUFFER = 0x00021010
  # Context client API hint and attribute.
  CLIENT_API = 0x00022001
  # Context client API major version hint and attribute.
  CONTEXT_VERSION_MAJOR = 0x00022002
  # Context client API minor version hint and attribute.
  CONTEXT_VERSION_MINOR = 0x00022003
  # Context client API revision number hint and attribute.
  CONTEXT_REVISION = 0x00022004
  # Context robustness hint and attribute.
  CONTEXT_ROBUSTNESS = 0x00022005
  # OpenGL forward-compatibility hint and attribute.
  OPENGL_FORWARD_COMPAT = 0x00022006
  # OpenGL debug context hint and attribute.
  OPENGL_DEBUG_CONTEXT = 0x00022007
  # OpenGL profile hint and attribute.
  OPENGL_PROFILE = 0x00022008
  # Context flush-on-release hint and attribute.
  CONTEXT_RELEASE_BEHAVIOR = 0x00022009
  # Context error suppression hint and attribute.
  CONTEXT_NO_ERROR = 0x0002200A
  # Context creation API hint and attribute.
  CONTEXT_CREATION_API = 0x0002200B
  # Window content area scaling window window hint.
  SCALE_TO_MONITOR = 0x0002200C
  # macOS specific window hint.
  COCOA_RETINA_FRAMEBUFFER = 0x00023001
  # macOS specific window hint.
  COCOA_FRAME_NAME = 0x00023002
  # macOS specific window hint.
  COCOA_GRAPHICS_SWITCHING = 0x00023003
  # X11 specific window hint.
  X11_CLASS_NAME = 0x00024001
  # X11 specific window hint.
  X11_INSTANCE_NAME = 0x00024002

  # Bit depth hints:
  DONT_CARE = -1

  # CLIENT_API hints:

  NO_API        =          0
  OPENGL_API    = 0x00030001
  OPENGL_ES_API = 0x00030002

  # OPENGL_PROFILE hints:

  OPENGL_ANY_PROFILE    =          0
  OPENGL_CORE_PROFILE   = 0x00032001
  OPENGL_COMPAT_PROFILE = 0x00032002

  # CONTEXT_ROBUSTNESS hints:

  NO_ROBUSTNESS         =          0
  NO_RESET_NOTIFICATION = 0x00031001
  LOSE_CONTEXT_ON_RESET = 0x00031002

  # CONTEXT_CREATION_API hints:

  NATIVE_CONTEXT_API = 0x00036001
  EGL_CONTEXT_API    = 0x00036002
  OSMESA_CONTEXT_API = 0x00036003

  # CONTEXT_RELEASE_BEHAVIOR hints:

  ANY_RELEASE_BEHAVIOR   =          0
  RELEASE_BEHAVIOR_FLUSH = 0x00035001
  RELEASE_BEHAVIOR_NONE  = 0x00035002

  # Input modes (set_input_mode):

  CURSOR               = 0x00033001
  STICKY_KEYS          = 0x00033002
  STICKY_MOUSE_BUTTONS = 0x00033003

  # CURSOR modes:

  CURSOR_NORMAL   = 0x00034001
  CURSOR_HIDDEN   = 0x00034002
  CURSOR_DISABLED = 0x00034003

  # Functions:

  # Resets all window hints to their default values.
  @[Raises]
  fun default_window_hints = glfwDefaultWindowHints

  # Sets the specified window hint to the desired value.
  @[Raises]
  fun window_hint = glfwWindowHint(hint : Int32,
                                   value : Int32)

  # This function sets hints for the next call to `#create_window`. The hints, once set, retain
  # their values until changed by a call to this function or `#default_window_hints`, or until the
  # library is terminated.
  #
  # Only string type hints can be set with this function. Integer value hints are set with
  # `#window_hint`.
  #
  # This function does not check whether the specified hint values are valid. If you set hints to
  # invalid values this will instead be reported by the next call to `#create_window`.
  #
  # Some hints are platform specific. These may be set on any platform but they will only affect
  # their specific platform. Other platforms will ignore them. Setting these hints requires no
  # platform specific headers or functions.
  #
  # This method accepts the following arguments:
  # - *hint*, the window hint to set.
  # - *value*, the new value of the window hint.
  #
  # Possible errors include NOT_INITIALIZED and INVALID_ENUM.
  @[Raises]
  fun window_hint_string = glfwWindowHintString(hint : Int32, value : UInt8*)

  # Creates a window and its associated OpenGL or OpenGL ES context.
  @[Raises]
  fun create_window = glfwCreateWindow(width : Int32,
                                       height : Int32,
                                       title : UInt8*,
                                       monitor : Monitor*,
                                       share : Window*) : Window*

  # Destroys the specified window and its context.
  @[Raises]
  fun destroy_window = glfwDestroyWindow(window : Window*)

  # Checks the close flag of the specified window.
  @[Raises]
  fun window_should_close = glfwWindowShouldClose(window : Window*) : Int32

  # Sets the close flag of the specified window.
  @[Raises]
  fun set_window_should_close = glfwSetWindowShouldClose(window : Window*,
                                                         value : Int32)

  # Sets the title of the specified window.
  @[Raises]
  fun set_window_title = glfwSetWindowTitle(window : Window*,
                                            title : UInt8*)

  # Sets the icon for the specified window.
  @[Raises]
  fun set_window_icon = glfwSetWindowIcon(window : Window*,
                                          count : Int32,
                                          images : Image*)

  # Retrieves the position of the client area of the specified window.
  @[Raises]
  fun get_window_pos = glfwGetWindowPos(window : Window*,
                                        xpos : Int32*,
                                        ypos : Int32*)

  # Sets the position of the client area of the specified window.
  @[Raises]
  fun set_window_pos = glfwSetWindowPos(window : Window*,
                                        xpos : Int32,
                                        ypos : Int32)

  # Retrieves the size of the client area of the specified window.
  @[Raises]
  fun get_window_size = glfwGetWindowSize(window : Window*,
                                          width : Int32*,
                                          height : Int32*)

  # Sets the size limits of the specified window.
  @[Raises]
  fun set_window_size_limits = glfwSetWindowSizeLimits(window : Window*,
                                                       minwidth : Int32,
                                                       minheight : Int32,
                                                       maxwidth : Int32,
                                                       maxheight : Int32)

  # Sets the aspect ratio of the specified window.
  @[Raises]
  fun set_window_aspect_ratio = glfwSetWindowAspectRatio(window : Window*,
                                                         numer : Int32,
                                                         denom : Int32)

  # Sets the size of the client area of the specified window.
  @[Raises]
  fun set_window_size = glfwSetWindowSize(window : Window*,
                                          width : Int32,
                                          height : Int32)

  # Retrieves the size of the framebuffer of the specified window.
  @[Raises]
  fun get_framebuffer_size = glfwGetFramebufferSize(window : Window*,
                                                    width : Int32*,
                                                    height : Int32*)

  # Retrieves the size of the frame of the window.
  @[Raises]
  fun get_window_frame_size = glfwGetWindowFrameSize(window : Window*,
                                                     left : Int32*,
                                                     top : Int32*,
                                                     right : Int32*,
                                                     bottom : Int32*)

  # This function retrieves the content scale for the specified window. The content scale is the
  # ratio between the current DPI and the platform's default DPI. This is especially important for
  # text and any UI elements. If the pixel dimensions of your UI scaled by this look appropriate on
  # your machine then it should appear at a reasonable size on other machines regardless of their
  # DPI and scaling settings. This relies on the system DPI and scaling settings being somewhat
  # correct.
  #
  # On systems where each monitors can have its own content scale, the window content scale will
  # depend on which monitor the system considers the window to be on.
  #
  # This method accepts the following arguments:
  # - *window*, the window to query.
  # - *xscale*, where to store the x-axis content scale, or nil.
  # - *yscale*, where to store the y-axis content scale, or nil.
  #
  # Possible errors include NOT_INITIALIZED and PLATFORM_ERROR.
  @[Raises]
  fun get_window_content_scale = glfwGetWindowContentScale(window : Window*, xscale : Float32*, yscale : Float32*)

  # This function returns the opacity of the window, including any decorations.
  #
  # The opacity (or alpha) value is a positive finite number between zero and one, where zero is
  # fully transparent and one is fully opaque. If the system does not support whole window
  # transparency, this function always returns one.
  #
  # The initial opacity value for newly created windows is one.
  #
  # This method accepts the following arguments:
  # - *window*, the window to query.
  #
  # Possible errors include NOT_INITIALIZED and PLATFORM_ERROR.
  @[Raises]
  fun get_window_opacity = glfwGetWindowOpacity(window : Window*) : Float32

  # This function sets the opacity of the window, including any decorations.
  #
  # The opacity (or alpha) value is a positive finite number between zero and one, where zero is
  # fully transparent and one is fully opaque.
  #
  # The initial opacity value for newly created windows is one.
  #
  # A window created with framebuffer transparency may not use whole window transparency. The
  # results of doing this are undefined.
  #
  # This method accepts the following arguments:
  # - *window, the window to set the opacity for.
  # - *opacity, the desired opacity of the specified window.
  #
  # Possible errors include NOT_INITIALIZED and PLATFORM_ERROR.
  @[Raises]
  fun set_window_opacity = glfwSetWindowOpacity(window : Window*, opacity : Float32)

  # Iconifies the specified window.
  @[Raises]
  fun iconify_window = glfwIconifyWindow(window : Window*)

  # Restores the specified window.
  @[Raises]
  fun restore_window = glfwRestoreWindow(window : Window*)

  # Maximizes the specified window.
  @[Raises]
  fun maximize_window = glfwMaximizeWindow(window : Window*)

  # Makes the specified window visible.
  @[Raises]
  fun show_window = glfwShowWindow(window : Window*)

  # Hides the specified window.
  @[Raises]
  fun hide_window = glfwHideWindow(window : Window*)

  # Brings the specified window to front and sets input focus.
  @[Raises]
  fun focus_window = glfwFocusWindow(window : Window*)

  # This function requests user attention to the specified window. On platforms where this is not
  # supported, attention is requested to the application as a whole.
  #
  # Once the user has given attention, usually by focusing the window or application, the system
  # will end the request automatically.
  #
  # This method accepts the following arguments:
  # - *window*, the window to request attention to.
  #
  # Possible errors include NOT_INITIALIZED and PLATFORM_ERROR.
  #
  # **Remarks**
  #
  # macOS: Attention is requested to the application as a whole, not the specific window.
  @[Raises]
  fun request_window_attention = glfwRequestWindowAttention(window : Window*)

  # Returns the monitor that the window uses for full screen mode.
  @[Raises]
  fun get_window_monitor = glfwGetWindowMonitor(window : Window*) : Monitor*

  # Sets the mode, monitor, video mode, and placement of a window.
  @[Raises]
  fun set_window_monitor = glfwSetWindowMonitor(window : Window*,
                                                monitor : Monitor*,
                                                xpos : Int32,
                                                ypos : Int32,
                                                width : Int32,
                                                height : Int32,
                                                refreshRate : Int32)

  # Returns an attribute of the specified window.
  @[Raises]
  fun get_window_attrib = glfwGetWindowAttrib(window : Window*,
                                              attrib : Int32) : Int32

  # This function sets the value of an attribute of the specified window.
  #
  # The supported attributes are DECORATED, RESIZABLE, FLOATING, AUTO_ICONIFY and FOCUS_ON_SHOW.
  #
  # Some of these attributes are ignored for full screen windows. The new value will take effect if
  # the window is later made windowed.
  #
  # Some of these attributes are ignored for windowed mode windows. The new value will take effect
  # if the window is later made full screen.
  #
  # This method accepts the following arguments:
  # - *window*, the window to set the attribute for.
  # - *attrib*, a supported window attribute.
  # - *value*, TRUE or FALSE.
  #
  # Possible errors include NOT_INITIALIZED, INVALID_ENUM, INVALID_VALUE and PLATFORM_ERROR.
  #
  # **Remarks**
  #
  # Calling `#get_window_attrib` will always return the latest value, even if that value is ignored
  # by the current mode of the window.
  @[Raises]
  fun set_window_attrib = glfwSetWindowAttrib(window : Window*, attrib : Int32, value : Int32)

  # Sets the user pointer of the specified window.
  @[Raises]
  fun set_window_user_pointer = glfwSetWindowUserPointer(window : Window*,
                                                         pointer : Void*)

  # Returns the user pointer of the specified window.
  @[Raises]
  fun get_window_user_pointer = glfwGetWindowUserPointer(window : Window*) : Void*

  # Sets the position callback for the specified window.
  @[Raises]
  fun set_window_pos_callback = glfwSetWindowPosCallback(window : Window*,
                                                         cbfun : Windowposfun) : Windowposfun

  # Sets the size callback for the specified window.
  @[Raises]
  fun set_window_size_callback = glfwSetWindowSizeCallback(window : Window*,
                                                           cbfun : Windowsizefun) : Windowsizefun

  # Sets the close callback for the specified window.
  @[Raises]
  fun set_window_close_callback = glfwSetWindowCloseCallback(window : Window*,
                                                             cbfun : Windowclosefun) : Windowclosefun

  # Sets the refresh callback for the specified window.
  @[Raises]
  fun set_window_refresh_callback = glfwSetWindowRefreshCallback(window : Window*,
                                                                 cbfun : Windowrefreshfun) : Windowrefreshfun

  # Sets the focus callback for the specified window.
  @[Raises]
  fun set_window_focus_callback = glfwSetWindowFocusCallback(window : Window*,
                                                             cbfun : Windowfocusfun) : Windowfocusfun

  # Sets the iconify callback for the specified window.
  @[Raises]
  fun set_window_iconify_callback = glfwSetWindowIconifyCallback(window : Window*,
                                                                 cbfun : Windowiconifyfun) : Windowiconifyfun

  # Sets the maximize callback for the specified window.
  @[Raises]
  fun set_window_maximize_callback = glfwSetWindowMaximizeCallback(window : Window*, cbfun : Windowmaximizefun) : Windowmaximizefun

  # Sets the framebuffer resize callback for the specified window.
  @[Raises]
  fun set_framebuffer_size_callback = glfwSetFramebufferSizeCallback(window : Window*,
                                                                     cbfun : Framebuffersizefun) : Framebuffersizefun

  # Sets the content scale callback for the specified window.
  @[Raises]
  fun set_window_content_scale_callback = glfwSetWindowContentScaleCallback(window : Window*,
                                                                            cbfun : Windowcontentscalefun) : Windowcontentscalefun

  # Processes all pending events.
  @[Raises]
  fun poll_events = glfwPollEvents

  # Waits until events are queued and processes them.
  @[Raises]
  fun wait_events = glfwWaitEvents

  # Waits with timeout until events are queued and processes them.
  @[Raises]
  fun wait_events_timeout = glfwWaitEventsTimeout(timeout : Float64)

  # Posts an empty event to the event queue.
  @[Raises]
  fun post_empty_event = glfwPostEmptyEvent

  # Swaps the front and back buffers of the specified window.
  @[Raises]
  fun swap_buffers = glfwSwapBuffers(window : Window*)
end
