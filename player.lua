player = {x=0,y=0}
bullets = {}

function player.load()
  rP = 0
  gP = 0
  bP = 0
  bulletSpeed = 400
  bulletSize = 1
  rBar = 0
  gBar = 0
  bBar = 0
  cooldown = 0
  cooldownMax = .5
  isAlive = true
  status = 1
end

function player.update(dt)

  rBar = (rP/255)*math.pi*2
  gBar = (gP/255)*math.pi*2
  bBar = (bP/255)*math.pi*2

  local mouseX = love.mouse.getX()
  local mouseY = love.mouse.getY()
  
  player.x = mouseX
  player.y = mouseY

  cooldown = cooldown - dt

  if love.keyboard.isDown("space") and cooldown < 0 then
		local startX = player.x + 20 / 2
		local startY = player.y + 20 / 2

		table.insert(bullets, {x = startX, y = startY, dx = 0, dy = bulletSpeed})
    cooldown = cooldownMax
  end

  -- dev tools

  cdmCOEFF = 5
  sizeCOEFF = .1
  speedCOEFF = 5

  bulletSize = 10+(rP*sizeCOEFF)
  bulletSpeed = (-100)-(gP*speedCOEFF)
  cooldownMax = 0.5-((bP/255)*cdmCOEFF)

  if love.keyboard.isDown("r") then
    if rP < 255 then
      rP = rP + 1
    end
  end
  if love.keyboard.isDown("g") then
    if gP < 255 then
      gP = gP + 1
    end
  end
  if love.keyboard.isDown("b") then
    if bP < 255 then
      bP = bP + 1
    end
  end

  -- bullet code
  
  for i,bullet in ipairs(bullets) do
		bullet.x = bullet.x + (bullet.dx * dt)
    bullet.y = bullet.y + (bullet.dy * dt)
    if bullet.x > windowWidth or bullet.x < 0 or bullet.y > windowHeight or bullet.y < 0 then
      table.remove(bullets,i)
    end
	end
  if isAlive == false then
    status = 0
  else
    status = 1
  end
end

function player.draw()
  love.graphics.setLineWidth(1)
  for i,bullet in ipairs(bullets) do
    love.graphics.setColor(1,1,1)
    love.graphics.circle("line",bullet.x,bullet.y,bulletSize*1.15,24)
    love.graphics.setColor(rP/255,gP/255,bP/255)
    love.graphics.circle("fill",bullet.x,bullet.y,bulletSize,24)
  end
  love.graphics.setColor(rP/255,gP/255,bP/255)
  love.graphics.circle("fill",player.x,player.y,20,24)
  love.graphics.setColor(0,0,255)
  love.graphics.arc("line",player.x,player.y,35,0,bBar)
  love.graphics.setColor(0,255,0)
  love.graphics.arc("line",player.x,player.y,30,0,gBar)
  love.graphics.setColor(255,0,0)
  love.graphics.arc("line",player.x,player.y,25,0,rBar)
  love.graphics.setColor(255,255,255)
  love.graphics.circle("line",player.x,player.y,20,24)
end
