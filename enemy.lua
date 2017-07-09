enemy = {x=640,y=50,xVel=-5}
enemies = {}
enemyBullets = {}

function enemy.load()
  enemyBulletCooldown = 0
  enemySpawnCooldown = 0
end

function enemy.update(dt)

  enemyBulletCooldown = enemyBulletCooldown - dt
  enemySpawnCooldown = enemySpawnCooldown - dt



  if enemySpawnCooldown < 0 then
    local newEnemy = {x=640,y=50}
    table.insert(enemies,newEnemy)
    enemySpawnCooldown = 4
  end

  enemy.x = enemy.x + enemy.xVel
  if enemy.x < 0 or enemy.x > 1280 then
    enemy.xVel = enemy.xVel * -1
  end

  for i, enemy in ipairs(enemies) do
    if enemyBulletCooldown < 0 then
      local newEnemyBullet = {x=enemy.x,y=enemy.y}
      table.insert(enemyBullets,newEnemyBullet)
      enemyBulletCooldown = 1
    end
  for j, enemyBullet in ipairs(enemyBullets) do
     enemyBullet.y = enemyBullet.y + (400 * dt)
     if enemyBullet.y < 0 then
       table.remove(enemyBullets, j) --removes bullet once out of frame
     end
   end
   for i, bullet in ipairs(bullets) do
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

function enemy.draw()
  love.graphics.setColor(255,255,255)
  love.graphics.circle("line",enemy.x,enemy.y,20,32)
  for j, enemyBullet in ipairs(enemyBullets) do
    love.graphics.setColor(255,255,255)
    love.graphics.circle("line",enemyBullet.x,enemyBullet.y,10,24)
  end
end
