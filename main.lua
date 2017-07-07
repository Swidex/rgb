bullet_tab = {}
local player = {x=650,y=350,xVel=0,yVel=0}


function love.load()
  rP = 0
  gP = 0
  bP = 0
  maxVel = 5
  minVel = -5
  cooldown = 0
  cooldownBase = .5
end

function love.update(dt)

  cooldown = cooldown - dt

  if love.keyboard.isDown("space") and cooldown < 0 then
    local bullet = {x=player.x,y=player.y}
    table.insert(bullet_tab,bullet)
    cooldown = cooldownBase
  end

  if player.xVel > 0 then
    player.xVel = player.xVel - .5
  end

  if player.xVel < 0 then
    player.xVel = player.xVel + .5
  end

  if player.yVel > 0 then
    player.yVel = player.yVel - .5
  end

  if player.yVel < 0 then
    player.yVel = player.yVel + .5
  end

  player.x = player.x + player.xVel
  player.y = player.y + player.yVel

  if love.keyboard.isDown("d") then
    if player.xVel > maxVel then

    else
      player.xVel = player.xVel + 1
    end
  end
  if love.keyboard.isDown("a") then
    if player.xVel < minVel then

    else
      player.xVel = player.xVel - 1
    end
  end
  if love.keyboard.isDown("s") then
    if player.yVel > maxVel then

    else
      player.yVel = player.yVel + 1
    end
  end
  if love.keyboard.isDown("w") then
    if player.yVel < minVel then

    else
      player.yVel = player.yVel - 1
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
    if bP < 255 then
      bP = bP + 1
      cooldownBase = cooldownBase - .0016
    end
  end
  for _,bullet in ipairs(bullet_tab) do
    bullet.y = bullet.y + dt*-400
  end
end

function love.draw()
  love.graphics.setBackgroundColor(35,35,35)
  love.graphics.setLineWidth(5)
  love.graphics.setColor(rP,gP,bP)
  love.graphics.circle("line",player.x,player.y,20,24)
  for _,bullet in ipairs(bullet_tab) do
    love.graphics.circle("line",bullet.x,bullet.y,10,12)
  end
end
