player = {}

player.frames = {
  love.graphics.newImage("art/player/Lizard1.png"),
  love.graphics.newImage("art/player/Lizard2.png"),
  love.graphics.newImage("art/player/Lizard3.png"),
  love.graphics.newImage("art/player/Lizard4.png")
}

function player:load()
  self.x = 220
  self.y = 200

  dodge.coolDown = 1.5

  player.frame = 3
  player.animTimer = 1.75

  player:updateAnim(0)
end

function player:update(dt)
  self:updateAnim(dt)

  dodge:update(dt)
  eat:update(dt)
end

function player:draw()
  love.graphics.draw(self.image, self.x, self.y, nil, 10)
end

function player:updateAnim(dt)
  self.animTimer = self.animTimer - dt

  if self.animTimer <= 0 then
    if self.frame == 1 then
      self.frame = 2
    else
      self.frame = 1
    end

    self.animTimer = 0.22
  end

  self.image = self.frames[self.frame]
end
