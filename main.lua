function love.load()
  title = love.graphics.newImage("img/title.png")
end

function love.update()

end

function love.draw()
  love.graphics.setBackgroundColor(0,0,0)
  love.graphics.draw(title,300,200)
end
