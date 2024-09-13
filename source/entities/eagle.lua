eagle = {}


eagle.animTimer = 0.25
eagle.frame = 1

eagle.y = -340
eagle.speed = 200

eagle.frames = {
  love.graphics.newImage("art/eagle/Eagle1.png"),
  love.graphics.newImage("art/eagle/Eagle2.png")
}

eagle.image = eagle.frames[eagle.frame]

function eagle:update(dt)
  self:updateAnim(dt)

  if dodge.timer and dodge.timer > 0 then
    self.y = self.y + self.speed * dt

    if self.speed < 265 then self.speed = self.speed * 1.1 end
  elseif self.y > -340 then
    self.y = self.y - 110 * dt
  end
end

function eagle:draw()
  love.graphics.draw(self.image, 0, self.y, nil, 10)
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

  self.image = self.frames[self.frame]
end
