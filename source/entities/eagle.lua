eagle = {}


eagle.animTimer = 0.25
eagle.frame = 1

eagle.y = -280
eagle.speed = 250

eagle.image = love.graphics.newImage("art/eagle/Eagle1.png")

function eagle:update(dt)
  self:updateAnim(dt)

  if dodge.timer and dodge.timer > 0 then
    self.y = self.y + self.speed * dt

    if self.speed < 300 then self.speed = self.speed * 1.1 end
  elseif self.y > -280 then
    self.y = self.y - 110 * dt
  end
end

function eagle:draw()
  love.graphics.draw(self.image, 10, self.y, nil, 8)
end

function eagle:updateAnim(dt)
  self.animTimer = self.animTimer - dt

  if self.animTimer <= 0 then
    if self.frame == 1 then
      self.frame = 2
    else
      self.frame = 1
    end

      self.animTimer = 0.25
  end

  self.image = love.graphics.newImage("art/eagle/Eagle" .. self.frame .. ".png")
end
