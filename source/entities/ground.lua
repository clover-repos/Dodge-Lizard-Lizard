ground = {}


ground.offX = 0

ground.image = love.graphics.newImage("art/ground.png")

function ground:update(dt, speed, maxX)
  if player.frame < 3 then
    self.offX = self.offX + (speed or 200) * dt
  end

  if self.offX >= (maxX or 800) then
    self.offX = 0
  end
end
