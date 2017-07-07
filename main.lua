function love.load()
  rP = 0
  gP = 0
  bP = 0
  x = 0
  y = 0
  xVel = 0
  yVel = 0
  maxVel = 25
  minVel = -25
end

function love.update(dt)

  if xVel > 0 then
    xVel = xVel - .25
  end

  if xVel < 0 then
    xVel = xVel + .25
  end

  if yVel > 0 then
    yVel = yVel - .25
  end

  if xVel < 0 then
    yVel = yVel + .25
  end

  x = x + xVel
  y = y + yVel

  if love.keyboard.isDown("d") then
    if xVel > maxVel then

    else
      xVel = xVel + .5
    end
  end
  if love.keyboard.isDown("a") then
    if xVel < minVel then

    else
      xVel = xVel - .5
    end
  end
  if love.keyboard.isDown("s") then
    if yVel > maxVel then

    else
      yVel = yVel + .5
    end
  end
  if love.keyboard.isDown("w") then
    if yVel < minVel then

    else
      yVel = yVel - .5
    end
  end


  if love.keyboard.isDown("escape") then
    love.window.close()
  end

  if love.keyboard.isDown("r") then
    rP = rP + 1
  end
  if love.keyboard.isDown("g") then
    gP = gP + 1
  end
  if love.keyboard.isDown("b") then
    bP = bP + 1
  end
end

function love.draw()
  love.graphics.setBackgroundColor(35,35,35)
  love.graphics.setColor(rP,gP,bP)
  love.graphics.circle("line", x, y, 50, 500)
  love.graphics.setColor(255,255,255)
  love.graphics.print("X Velocity:",0,0)
  love.graphics.print(xVel,0,10)
  love.graphics.print("Y Velocity:",0,20)
  love.graphics.print(yVel,0,30)
end
