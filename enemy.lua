enemies = {}
enemyBullets = {}
enemy = {}

function enemy.load()
  createEnemyTimerMax = .5
  createEnemyTimer = createEnemyTimerMax
  enemyBulletCooldown = 0
end

function enemy.update(dt)

  createEnemyTimer = createEnemyTimer - dt
  if createEnemyTimer < 0 then
    createEnemyTimer = createEnemyTimerMax
    local newEnemy = {x = love.math.random(0,1280),y=150,color=math.random(0,2),redColor=0,greenColor=0,blueColor=0}
    table.insert(enemies,newEnemy)
  end

  for i, enemy in ipairs(enemies) do
    if enemy.color == 0 then
      enemy.redColor = 0
      enemy.greenColor = 0
      enemy.blueColor = 255
    elseif enemy.color == 1 then
      enemy.redColor = 0
      enemy.greenColor = 255
      enemy.blueColor = 0
    elseif enemy.color == 2 then
      enemy.redColor = 255
      enemy.greenColor = 0
      enemy.blueColor = 0
    end
    for j, bullet in ipairs(bullets) do
      if CheckCollision(enemy.x, enemy.y, 30, 30, bullet.x, bullet.y, 20, 20) then
        table.remove(bullets, j)
        table.remove(enemies, i)
        if enemy.color == 0 then
          if bP < 255 then
            bP = bP + 1
            cooldownMax = cooldownMax - .002
          end
        elseif enemy.color == 1 then
          if gP < 255 then
            gP = gP + 1
            bulletSpeed = bulletSpeed + 5
          end
        elseif enemy.color == 2 then
          if  rP < 255 then
            rP = rP + 1
            bulletDamage = bulletDamage + 1
          end
        end
    end
  end
  if CheckCollision(enemy.x, enemy.y, 20, 20, player.x, player.y, 10, 10) and isAlive then
    table.remove(enemies, i)
    isAlive = false
  end
  end
end

function enemy.draw()
  for i, enemy in ipairs(enemies) do
    love.graphics.setColor(enemy.redColor,enemy.greenColor,enemy.blueColor)
    love.graphics.circle("line",enemy.x,enemy.y,20,12)
  end
end
