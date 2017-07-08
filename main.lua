function CheckCollision(x1,y1,w1,h1, x2,y2,w2,h2)
  return x1 < x2+w2 and
         x2 < x1+w1 and
         y1 < y2+h2 and
         y2 < y1+h1
end

require 'player'
require 'enemy'

function love.load()
  player.load()
  enemy.load()
end

function love.update(dt)
  player.update(dt)
  enemy.update(dt)
  if love.keyboard.isDown("escape") then
    love.window.close()
  end
end

function love.draw()
  love.graphics.setBackgroundColor(35,35,35)
  player.draw()
  enemy.draw()
end
