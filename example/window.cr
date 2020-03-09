require "../src/lib_glfw"

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
