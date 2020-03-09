# LibGLFW

GLFW 3.x bindings written in Crystal.

LibGLFW offers Crystal bindings for the [full GLFW
specification](http://www.glfw.org/docs/latest/glfw3_8h.html). These bindings
are relatively "raw". The `GLFW` prefix has been removed from functions,
constants, and types (as everything is scoped under `LibGLFW`), and function
names have been written in `snake_case`.

LibGLFW currently supports GLFW 3.3.2, minus native functions.


## Installation

First, make sure you've got GLFW 3:

```sh
# Void Linux
xbps-install glfw glfw-devel

# macOS
brew install glfw3

# Others: varies.
```

Add LibGLFW to your application's `shard.yml` as a dependency:

```yaml
dependencies:
  lib_glfw:
    github: nilium/LibGLFW
    branch: v3.3
```

Install your dependencies:

```sh
shards install
```

## Usage

```crystal
require "lib_glfw"

# Initialize GLFW
LibGLFW.init

begin

  width, height, title, monitor, share = 640, 480, "My First Window!", nil, nil

  # Create a window and its associated OpenGL context.
  window_handle = LibGLFW.create_window(width, height, title, monitor, share)

  # Render new frames until the window should close.
  until LibGLFW.window_should_close(window_handle) == LibGLFW::TRUE
    LibGLFW.wait_events
    LibGLFW.swap_buffers(window_handle)
  end

  # Destroy the window along with its context.
  LibGLFW.destroy_window(window_handle)

ensure
  # Terminate GLFW
  LibGLFW.terminate
end
```

## Differences From the C API

LibGLFW differs from the standard GLFW API in only a few, simple ways. Each of
these differences only exists to make the API fit the [style
guide](https://crystal-lang.org/docs/conventions/coding_style.html) of the
Crystal language.

### Functions/Methods

Method names in LibGLFW do not have the "glfw" prefix that is present in the
C API. Additionally, underscores are used to separate words rather than camel
case. LibGLFW methods are all called as class methods of the LibGLFW lib.

In C:
```c
  // Get and print the current version of GLFW
  int major, minor, rev;
  glfwGetVersion(&major, &minor, &rev);
  printf("Current version of GLFW is %d.%d.%d\n", major, minor, rev);
```

In Crystal:
```crystal
# Get and print the current version of GLFW
LibGLFW.get_version(out major, out minor, out rev)
puts "Current version of GLFW is #{major}.#{minor}.#{rev}"
```

### Constants

Prefixes have also been removed from constants, which are accessed directly from the lib.

In C:
```c
// Check to see if the joystick is present and complain if it isn't.
if (!glfwJoystickPresent(GLFW_JOYSTICK_9)) {
  printf("Joystick not present.\n");
}
```

In Crystal:
```crystal
# Check to see if the joystick is present and complain if it isn't.
puts "Joystick not present." unless LibGLFW.joystick_present(LibGLFW::JOYSTICK_9)
```

## Contributing

1. [Fork it.](https://github.com/nilium/LibGLFW/fork)
2. Create a feature branch (`git checkout -b my-new-feature`).
3. Add your name to the license for any changes you made (`Copyright <year> <your name>.`).
4. Commit your changes (`git add <files>; git commit -v`).
5. Push to the branch (`git push -u origin my-new-feature`)
6. Create a new pull request.

## Contributors

- [calebuharrison](https://github.com/calebuharrison) Caleb Uriah Harrison - Author the original [LibGLFW](https://github.com/calebuharrison/LibGLFW).
- [nilium](https://github.com/nilium) Noel Cower - Maintainer of `nilium/lib_glfw`.
