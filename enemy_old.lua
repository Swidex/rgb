enemies = {}
enemyBullets = {}
enemy = {}

function enemy.load()
  createEnemyTimerMax = .5
  createEnemyTimer = createEnemyTimerMax
  enemyBulletCooldown = 0
end

function enemy.update(dt)
  enemyBulletCooldown = enemyBulletCooldown - dt
  createEnemyTimer = createEnemyTimer - dt
  if createEnemyTimer < 0 then
    createEnemyTimer = createEnemyTimerMax
    local newEnemy = {x = love.math.random(0,1280),y=150,color=math.random(0,2),redColor=0,greenColor=0,blueColor=0}
    table.insert(enemies,newEnemy)
  end
  if enemyBulletCooldown < 0 then
    local newEnemyBullet = {x=enemy.x,y=enemy.y}
    table.insert(enemyBullets,newEnemyBullet)
    enemyBulletCooldown = 1
  end

  for i, enemy in ipairs(enemies) do
    for j, enemyBullet in ipairs(enemyBullets) do
       enemyBullet.y = enemyBullet.y - (400 * dt)
       if enemyBullet.y < 0 then
         table.remove(enemyBullets, j) --removes bullet once out of frame
       end
     end
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
    for k, bullet in ipairs(bullets) do
      if CheckCollision(enemy.x, enemy.y, 30, 30, bullet.x, bullet.y, 20, 20) then
        table.remove(bullets, k)
        table.remove(enemies, i)
        if enemy.color == 0 then
          if bP < 255 then
            bP = bP + 1
            cooldownMax = cooldownMax - 0.0025
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
  if CheckCollision(enemy.x, enemy.y, 20, 20, player.x, player.y, 10, 10) then
    table.remove(enemies, i)
    isAlive = false
  end
  end
end

function enemy.draw()
  for i, enemy in ipairs(enemies) do
    love.graphics.setColor(enemy.redColor,enemy.greenColor,enemy.blueColor)
    love.graphics.circle("line",enemy.x,enemy.y,20,32)
  end
  for i, bullet in ipairs(enemyBullets) do
    love.graphics.setColor(255,255,255)
    love.graphics.circle("line",enemyBullet.y,enemyBullet.y,10,24)
  end
end
