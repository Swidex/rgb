bullet_tab = {}
enemy_tab = {}
local player = {x=650,y=350,xVel=0,yVel=0}


function love.load()
  rP = 0
  gP = 0
  bP = 0
  maxVel = 10
  minVel = -10
  cooldown = 0
  cooldownBase = .5
  framerate = 0
  bulletSpeed= 400
  rBar = 0
  gBar = 0
  bBar = 0

end

function love.update(dt)

  rBar = (rP/255)*math.pi*2
  gBar = (gP/255)*math.pi*2
  bBar = (bP/255)*math.pi*2

  cooldown = cooldown - dt

  if love.keyboard.isDown("space") and cooldown < 0 then
    local bullet = {x=player.x,y=player.y}
    table.insert(bullet_tab,bullet)
    cooldown = cooldownBase
  end

  if love.keyboard.isDown("e") then
    local enemy = {x = love.math.random(0,1280),y=150}
    table.insert(enemy_tab,enemy)
  end

  if player.x > 1280 then
    player.xVel = player.xVel*-1
  end

  if player.x < 0 then
    player.xVel = player.xVel*-1
  end

  if player.y > 720 then
    player.yVel = player.yVel*-1
  end

  if player.y < 0 then
    player.yVel = player.yVel*-1
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
    if rP < 255 then
      rP = rP + 1
    end
  end
  if love.keyboard.isDown("g") then
    if gP < 255 then
      gP = gP + 1
      bulletSpeed = bulletSpeed + 5
    end
  end
  if love.keyboard.isDown("b") then
    if bP < 255 then
      bP = bP + 1
      cooldownBase = cooldownBase - .0016
    end
  end
  for _,bullet in ipairs(bullet_tab) do
    bullet.y = bullet.y + dt*-bulletSpeed
  end
end

function love.draw()
  love.graphics.setBackgroundColor(35,35,35)
  love.graphics.setLineWidth(5)
  love.graphics.setColor(0,0,255)
  love.graphics.arc("line",player.x,player.y,40,0,bBar)
  love.graphics.setColor(0,255,0)
  love.graphics.arc("line",player.x,player.y,30,0,gBar)
  love.graphics.setColor(255,0,0)
  love.graphics.arc("line",player.x,player.y,20,0,rBar)
  love.graphics.setColor(255,255,255)
  love.graphics.print(player.x,0,0)
  love.graphics.print(player.y,0,10)
  love.graphics.circle("fill",player.x,player.y,10)
  for _,bullet in ipairs(bullet_tab) do
    love.graphics.circle("line",bullet.x,bullet.y,10,12)
  end
  for _,enemy in ipairs(enemy_tab) do
    love.graphics.circle("line",enemy.x,enemy.y,20,12)
  end
end
