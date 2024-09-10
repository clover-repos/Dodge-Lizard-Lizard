camera = {}


camera.bottomY = 200
camera.topY = -100

camera.y = camera.topY

camera.timer = 3
camera.state = 2

camera.dodgeTime = 0
camera.secondDodgeTime = 0
camera.eatTime = -10

function camera:attach()
  love.graphics.push()
  love.graphics.translate(0, self.y)
end

function camera:detach()
  love.graphics.pop()
end

function camera:update(dt)
  self.timer = self.timer - dt

  if self.timer <= 0 then
    if self.state == 1 then
      self.y = self.y - 350 * dt

      if self.y <= self.topY then
        self.timer = 5
        self.state = 2
      end

      self.eatTime = math.random(1, 4)
    elseif self.state == 2 then
      self.y = self.y + 350 * dt

      if self.y >= self.bottomY then
        self.timer = 10
        self.state = 1

        self.dodgeTime = math.random(1, 5)
        self.secondDodgeTime = math.random(6.5, 9)
      end
    end
  end

  if self.state == 1 then
    if self.timer < self.dodgeTime then
      dodge.winner = nil

      dodge.timer = dodge.time
      self.dodgeTime = -10

      dodge:startDraw()
    elseif self.timer < self.secondDodgeTime then
      dodge.winner = nil

      dodge.timer = dodge.time
      self.secondDodgeTime = -10

      dodge:startDraw()
    end
  else
    if self.timer < self.eatTime then
      eat:startDraw()

      eat.timer = 0.6
      self.eatTime = -10
    end
  end

  if self.y < self.topY then
    self.y = self.topY
  end

  if self.y > self.bottomY then
    self.y = self.bottomY
  end
end
