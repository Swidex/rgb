function love.conf(t)
  t.identity = "rgb"
  t.version = "0.10.2"

  t.window.width = 1280
  t.window.height = 720
  t.console = false
  t.window.resizable = false
  t.window.title = "RGB - Modern Bullet Hell Game"

  t.window.vsync = true
  t.window.msaa = 8
end
