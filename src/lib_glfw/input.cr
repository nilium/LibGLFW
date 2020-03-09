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

# Input functions, types, and constants.

require "./lib"

lib LibGLFW
  # Device (monitors, joysticks) connection events:

  CONNECTED    = 0x00040001
  DISCONNECTED = 0x00040002

  # Keys:

  KEY_UNKNOWN       =  -1
  KEY_SPACE         =  32
  KEY_APOSTROPHE    =  39
  KEY_COMMA         =  44
  KEY_MINUS         =  45
  KEY_PERIOD        =  46
  KEY_SLASH         =  47
  KEY_0             =  48
  KEY_1             =  49
  KEY_2             =  50
  KEY_3             =  51
  KEY_4             =  52
  KEY_5             =  53
  KEY_6             =  54
  KEY_7             =  55
  KEY_8             =  56
  KEY_9             =  57
  KEY_SEMICOLON     =  59
  KEY_EQUAL         =  61
  KEY_A             =  65
  KEY_B             =  66
  KEY_C             =  67
  KEY_D             =  68
  KEY_E             =  69
  KEY_F             =  70
  KEY_G             =  71
  KEY_H             =  72
  KEY_I             =  73
  KEY_J             =  74
  KEY_K             =  75
  KEY_L             =  76
  KEY_M             =  77
  KEY_N             =  78
  KEY_O             =  79
  KEY_P             =  80
  KEY_Q             =  81
  KEY_R             =  82
  KEY_S             =  83
  KEY_T             =  84
  KEY_U             =  85
  KEY_V             =  86
  KEY_W             =  87
  KEY_X             =  88
  KEY_Y             =  89
  KEY_Z             =  90
  KEY_LEFT_BRACKET  =  91
  KEY_BACKSLASH     =  92
  KEY_RIGHT_BRACKET =  93
  KEY_GRAVE_ACCENT  =  96
  KEY_WORLD_1       = 161
  KEY_WORLD_2       = 162
  KEY_ESCAPE        = 256
  KEY_ENTER         = 257
  KEY_TAB           = 258
  KEY_BACKSPACE     = 259
  KEY_INSERT        = 260
  KEY_DELETE        = 261
  KEY_RIGHT         = 262
  KEY_LEFT          = 263
  KEY_DOWN          = 264
  KEY_UP            = 265
  KEY_PAGE_UP       = 266
  KEY_PAGE_DOWN     = 267
  KEY_HOME          = 268
  KEY_END           = 269
  KEY_CAPS_LOCK     = 280
  KEY_SCROLL_LOCK   = 281
  KEY_NUM_LOCK      = 282
  KEY_PRINT_SCREEN  = 283
  KEY_PAUSE         = 284
  KEY_F1            = 290
  KEY_F2            = 291
  KEY_F3            = 292
  KEY_F4            = 293
  KEY_F5            = 294
  KEY_F6            = 295
  KEY_F7            = 296
  KEY_F8            = 297
  KEY_F9            = 298
  KEY_F10           = 299
  KEY_F11           = 300
  KEY_F12           = 301
  KEY_F13           = 302
  KEY_F14           = 303
  KEY_F15           = 304
  KEY_F16           = 305
  KEY_F17           = 306
  KEY_F18           = 307
  KEY_F19           = 308
  KEY_F20           = 309
  KEY_F21           = 310
  KEY_F22           = 311
  KEY_F23           = 312
  KEY_F24           = 313
  KEY_F25           = 314
  KEY_KP_0          = 320
  KEY_KP_1          = 321
  KEY_KP_2          = 322
  KEY_KP_3          = 323
  KEY_KP_4          = 324
  KEY_KP_5          = 325
  KEY_KP_6          = 326
  KEY_KP_7          = 327
  KEY_KP_8          = 328
  KEY_KP_9          = 329
  KEY_KP_DECIMAL    = 330
  KEY_KP_DIVIDE     = 331
  KEY_KP_MULTIPLY   = 332
  KEY_KP_SUBTRACT   = 333
  KEY_KP_ADD        = 334
  KEY_KP_ENTER      = 335
  KEY_KP_EQUAL      = 336
  KEY_LEFT_SHIFT    = 340
  KEY_LEFT_CONTROL  = 341
  KEY_LEFT_ALT      = 342
  KEY_LEFT_SUPER    = 343
  KEY_RIGHT_SHIFT   = 344
  KEY_RIGHT_CONTROL = 345
  KEY_RIGHT_ALT     = 346
  KEY_RIGHT_SUPER   = 347
  KEY_MENU          = 348
  KEY_LAST          = KEY_MENU

  # Key modifier bits:

  # If this bit is set one or more Shift keys were held down.
  MOD_SHIFT = 0x0001

  # If this bit is set one or more Control keys were held down.
  MOD_CONTROL = 0x0002

  # If this bit is set one or more Alt keys were held down.
  MOD_ALT = 0x0004

  # If this bit is set one or more Super keys were held down.
  MOD_SUPER = 0x0008

  # If this bit is set the Caps Lock key is enabled.
  MOD_CAPS_LOCK = 0x0010

  # If this bit is set the Num Lock key is enabled.
  MOD_NUM_LOCK = 0x0020

  # Mouse buttons:

  MOUSE_BUTTON_1    = 0
  MOUSE_BUTTON_2    = 1
  MOUSE_BUTTON_3    = 2
  MOUSE_BUTTON_4    = 3
  MOUSE_BUTTON_5    = 4
  MOUSE_BUTTON_6    = 5
  MOUSE_BUTTON_7    = 6
  MOUSE_BUTTON_8    = 7
  MOUSE_BUTTON_LAST = MOUSE_BUTTON_8

  MOUSE_BUTTON_LEFT   = MOUSE_BUTTON_1
  MOUSE_BUTTON_RIGHT  = MOUSE_BUTTON_2
  MOUSE_BUTTON_MIDDLE = MOUSE_BUTTON_3

  # Joystick IDs:

  JOYSTICK_1    =  0
  JOYSTICK_2    =  1
  JOYSTICK_3    =  2
  JOYSTICK_4    =  3
  JOYSTICK_5    =  4
  JOYSTICK_6    =  5
  JOYSTICK_7    =  6
  JOYSTICK_8    =  7
  JOYSTICK_9    =  8
  JOYSTICK_10   =  9
  JOYSTICK_11   = 10
  JOYSTICK_12   = 11
  JOYSTICK_13   = 12
  JOYSTICK_14   = 13
  JOYSTICK_15   = 14
  JOYSTICK_16   = 15
  JOYSTICK_LAST = JOYSTICK_16

  # Gamepad axes:

  GAMEPAD_AXIS_LEFT_X        = 0
  GAMEPAD_AXIS_LEFT_Y        = 1
  GAMEPAD_AXIS_RIGHT_X       = 2
  GAMEPAD_AXIS_RIGHT_Y       = 3
  GAMEPAD_AXIS_LEFT_TRIGGER  = 4
  GAMEPAD_AXIS_RIGHT_TRIGGER = 5
  GAMEPAD_AXIS_LAST          = GAMEPAD_AXIS_RIGHT_TRIGGER

  # Gamepad buttons:

  GAMEPAD_BUTTON_A            =  0
  GAMEPAD_BUTTON_B            =  1
  GAMEPAD_BUTTON_X            =  2
  GAMEPAD_BUTTON_Y            =  3
  GAMEPAD_BUTTON_LEFT_BUMPER  =  4
  GAMEPAD_BUTTON_RIGHT_BUMPER =  5
  GAMEPAD_BUTTON_BACK         =  6
  GAMEPAD_BUTTON_START        =  7
  GAMEPAD_BUTTON_GUIDE        =  8
  GAMEPAD_BUTTON_LEFT_THUMB   =  9
  GAMEPAD_BUTTON_RIGHT_THUMB  = 10
  GAMEPAD_BUTTON_DPAD_UP      = 11
  GAMEPAD_BUTTON_DPAD_RIGHT   = 12
  GAMEPAD_BUTTON_DPAD_DOWN    = 13
  GAMEPAD_BUTTON_DPAD_LEFT    = 14
  GAMEPAD_BUTTON_LAST         = GAMEPAD_BUTTON_DPAD_LEFT
  GAMEPAD_BUTTON_CROSS        = GAMEPAD_BUTTON_A
  GAMEPAD_BUTTON_CIRCLE       = GAMEPAD_BUTTON_B
  GAMEPAD_BUTTON_SQUARE       = GAMEPAD_BUTTON_X
  GAMEPAD_BUTTON_TRIANGLE     = GAMEPAD_BUTTON_Y

  # Joystick hat states:

  HAT_CENTERED   = 0
  HAT_UP         = 1
  HAT_RIGHT      = 2
  HAT_DOWN       = 4
  HAT_LEFT       = 8
  HAT_RIGHT_UP   = (HAT_RIGHT | HAT_UP)
  HAT_RIGHT_DOWN = (HAT_RIGHT | HAT_DOWN)
  HAT_LEFT_UP    = (HAT_LEFT | HAT_UP)
  HAT_LEFT_DOWN  = (HAT_LEFT | HAT_DOWN)

  # Key and button actions:

  # The key or mouse button was released.
  RELEASE = 0

  # The key or mouse button was pressed.
  PRESS = 1

  # The key was held down until it repeated.
  REPEAT = 2

  # Standard cursor shapes:

  ARROW_CURSOR     = 0x00036001
  IBEAM_CURSOR     = 0x00036002
  CROSSHAIR_CURSOR = 0x00036003
  HAND_CURSOR      = 0x00036004
  HRESIZE_CURSOR   = 0x00036005
  VRESIZE_CURSOR   = 0x00036006

  # The function signature for mouse button callbacks.
  alias Mousebuttonfun = (Pointer(Window), Int32, Int32, Int32 -> Void)

  # The function signature for cursor position callbacks.
  alias Cursorposfun = (Pointer(Window), Float64, Float64 -> Void)

  # The function signature for cursor enter/leave callbacks.
  alias Cursorenterfun = (Pointer(Window), Int32 -> Void)

  # The function signature for scroll callbacks.
  alias Scrollfun = (Pointer(Window), Float64, Float64 -> Void)

  # The function signature for keyboard key calbacks.
  alias Keyfun = (Pointer(Window), Int32, Int32, Int32, Int32 -> Void)

  # The function signature for Unicode character callbacks.
  alias Charfun = (Pointer(Window), UInt32 -> Void)

  # The function signature for Unicode character with modifiers callbacks.
  alias Charmodsfun = (Pointer(Window), UInt32, Int32 -> Void)

  # The function signature for file drop callbacks.
  alias Dropfun = (Pointer(Window), Int32, Pointer(Pointer(UInt8)) -> Void)

  # The function signature for joystick configuration callbacks.
  alias Joystickfun = (Int32, Int32 -> Void)

  # Opaque cursor object.
  type Cursor = Void

  # Gamepad input state.
  struct Gamepadstate
    buttons : UInt8[15]
    axes : Float32[6]
  end

  # Returns the value of an input option for the specified window.
  @[Raises]
  fun get_input_mode = glfwGetInputMode(window : Window*,
                                        mode : Int32) : Int32

  # Sets an input option for the specified window.
  @[Raises]
  fun set_input_mode = glfwSetInputMode(window : Window*,
                                        mode : Int32,
                                        value : Int32)

  # Returns whether raw mouse motion is supported on the current system.
  @[Raises]
  fun raw_mouse_motion_supported = glfwRawMouseMotionSupported : Int32

  # Returns the localized name of the specified printable key.
  @[Raises]
  fun get_key_name = glfwGetKeyName(key : Int32,
                                    scancode : Int32) : UInt8*

  # Returns the platform-specific scancode of the specified key.
  @[Raises]
  fun get_key_scancode = glfwGetKeyScancode(key : Int32) : Int32

  # Returns the last reported state of a keyboard key for the specified window.
  @[Raises]
  fun get_key = glfwGetKey(window : Window*,
                           key : Int32) : Int32

  # Returns the last reported state of a mouse button for the specified window.
  @[Raises]
  fun get_mouse_button = glfwGetMouseButton(window : Window*,
                                            button : Int32) : Int32

  # Retrieves the position of the cursor relative to the client area of the window.
  @[Raises]
  fun get_cursor_pos = glfwGetCursorPos(window : Window*,
                                        xpos : Float64*,
                                        ypos : Float64*)

  # Sets the position of the curosr, relative to the client area of the window.
  @[Raises]
  fun set_cursor_pos = glfwSetCursorPos(window : Window*,
                                        xpos : Float64,
                                        ypose : Float64)

  # Creates a custom cursor.
  @[Raises]
  fun create_cursor = glfwCreateCursor(image : Image*,
                                       xhot : Int32,
                                       yhot : Int32) : Cursor*

  # Creates a cursor with a standard shape.
  @[Raises]
  fun create_standard_cursor = glfwCreateStandardCursor(shape : Int32) : Cursor*

  # Destroys a cursor
  @[Raises]
  fun destroy_cursor = glfwDestroyCursor(cursor : Cursor*)

  # Sets the cursor for the window.
  @[Raises]
  fun set_cursor = glfwSetCursor(window : Window*,
                                 cursor : Cursor*)

  # Sets the key callback.
  @[Raises]
  fun set_key_callback = glfwSetKeyCallback(window : Window*,
                                            cbfun : Keyfun) : Keyfun

  # Sets the Unicode character callback.
  @[Raises]
  fun set_char_callback = glfwSetCharCallback(window : Window*,
                                              cbfun : Charfun) : Charfun

  # Sets the Unicode character with modifiers callback.
  #
  # Deprecated in GLFW 3.3. The callback will be removed in the next major version.
  @[Raises]
  fun set_char_mods_callback = glfwSetCharModsCallback(window : Window*,
                                                       cbfun : Charmodsfun) : Charmodsfun

  # Sets the mouse button callback.
  @[Raises]
  fun set_mouse_button_callback = glfwSetMouseButtonCallback(window : Window*,
                                                             cbfun : Mousebuttonfun) : Mousebuttonfun

  # Sets the cursor position callback.
  @[Raises]
  fun set_cursor_pos_callback = glfwSetCursorPosCallback(window : Window*,
                                                         cbfun : Cursorposfun) : Cursorposfun

  # Sets the cursor enter/exit callback.
  @[Raises]
  fun set_cursor_enter_callback = glfwSetCursorEnterCallback(window : Window*,
                                                             cbfun : Cursorenterfun) : Cursorenterfun

  # Sets the scroll callback.
  @[Raises]
  fun set_scroll_callback = glfwSetScrollCallback(window : Window*,
                                                  cbfun : Scrollfun) : Scrollfun

  # Sets the file drop callback.
  @[Raises]
  fun set_drop_callback = glfwSetDropCallback(window : Window*,
                                              cbfun : Dropfun) : Dropfun

  # Returns whether the specified joystick is present.
  @[Raises]
  fun joystick_present = glfwJoystickPresent(joy : Int32) : Int32

  # Returns the values of all axes of the specified joystick.
  @[Raises]
  fun get_joystick_axes = glfwGetJoystickAxes(joy : Int32,
                                              count : Int32*) : Float32*

  # Returns the state of all button of the specified joystick.
  @[Raises]
  fun get_joystick_buttons = glfwGetJoystickButtons(joy : Int32,
                                                    count : Int32*) : UInt8*

  # Returns the state of all hats of the specified joystick.
  @[Raises]
  fun get_joystick_hats = glfwGetJoystickHats(joy : Int32, count : Int32*) : UInt8*

  # Returns the name of the specified joystick.
  @[Raises]
  fun get_joystick_name = glfwGetJoystickName(joy : Int32) : UInt8*

  # Returns the SDL compatible GUID, as a UTF-8 encoded hexadecimal string, of the specified
  # joystick.
  @[Raises]
  fun get_joystick_guid = glfwGetJoystickGUID(jid : Int32) : UInt8*

  # Sets the user-defined pointer of the specified joystick.
  # The initial value is nil.
  @[Raises]
  fun set_joystick_user_pointer = glfwSetJoystickUserPointer(jid : Int32, pointer : Void*)

  # Gets the current value of the user-defined pointer of the specified joystick.
  # The initial value is nil.
  @[Raises]
  fun get_joystick_user_pointer = glfwGetJoystickUserPointer(jid : Int32) : Void*

  # Returns whether the specified joystick is both present and has a gamepad mapping.
  @[Raises]
  fun joystick_is_gamepad = glfwJoystickIsGamepad(jid : Int32) : Int32

  # Sets the joystick configuration callback.
  @[Raises]
  fun set_joystick_callback = glfwSetJoystickCallback(cbfun : Joystickfun) : Joystickfun

  # This function parses the specified ASCII encoded string and updates the internal list with any
  # gamepad mappings it finds. This string may contain either a single gamepad mapping or many
  # mappings separated by newlines. The parser supports the full format of the gamecontrollerdb.txt
  # source file including empty lines and comments.
  #
  # See [Gamepad mappings](https://www.glfw.org/docs/latest/input_guide.html#gamepad_mapping) for
  # a description of the format.
  #
  # If there is already a gamepad mapping for a given GUID in the internal list, it will be replaced
  # by the one passed to this function. If the library is terminated and re-initialized the internal
  # list will revert to the built-in default.
  #
  # Returns TRUE if successful, or FALSE if an error occurred.
  @[Raises]
  fun update_gamepad_mappings = glfwUpdateGamepadMappings(string : UInt8*) : Int32

  # Returns the human-readable name of the gamepad from the gamepad mapping assigned to the
  # specified joystick.
  @[Raises]
  fun get_gamepad_name = glfwGetGamepadName(jid : Int32) : UInt8*

  # Retrieves the state of the specified joystick remapped to an Xbox-like gamepad.
  @[Raises]
  fun get_gamepad_state = glfwGetGamepadState(jid : Int32, state : Gamepadstate*) : Int32

  # Sets the clipboard to the specified string.
  @[Raises]
  fun set_clipboard_string = glfwSetClipboardString(window : Window*,
                                                    string : UInt8*)

  # Returns the contents of the clipboard as a string.
  @[Raises]
  fun get_clipboard_string = glfwGetClipboardString(window : Window*) : UInt8*

  # Returns the value of the GLFW timer.
  @[Raises]
  fun get_time = glfwGetTime : Float64

  # Sets the GLFW timer.
  @[Raises]
  fun set_time = glfwSetTime(time : Float64)

  # Returns the current value of the raw timer.
  @[Raises]
  fun get_timer_value = glfwGetTimerValue : UInt64

  # Returns the frequency, in Hz, of the raw timer.
  @[Raises]
  fun get_timer_frequency = glfwGetTimerFrequency : UInt64
end
