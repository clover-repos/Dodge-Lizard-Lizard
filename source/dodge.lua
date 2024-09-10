--This file is for eating and dodging

dodge = {}

dodge.drawTime = 0
dodge.time = 0.5

dodge.coolDown = 0

dodge.winner = true

function dodge:update(dt)
  if self.coolDown > 0 then self.coolDown = self.coolDown - dt end

  if self.timer and self.timer > 0 then
    self.timer = self.timer - dt

    if inputs:pressed "down" and self.timer > 0 and not self.winner and self.coolDown < 0 then
      self.winner = true

      score = score + 1

      self.coolDown = 1

      player.frame = 3
      player.animTimer = 0.35
    elseif self.timer <= 0 and not self.winner then
      self.winner = false

      if score > highScore then
        highScore = score
      end

      eagle.speed = 250


      self.time = 0.5

      gamestate = "death"
      audio.theme:stop()

      audio.death:play()
    end
  end

  if inputs:pressed "down" and self.coolDown <= 0 then
    self.coolDown = 1.5

    player.frame = 3
    player.animTimer = 0.35
  end

  if score < 0 then score = 0 end
end

function dodge:draw()
  if self.drawTime > 0 then
    self.drawTime = self.drawTime - publicDT

    love.graphics.setColor(1, 0.25, 0)
      love.graphics.print("Dodge!!!", 400, 400)
    love.graphics.setColor(1, 1, 1)
  end
end

function dodge:startDraw()
  self.drawTime = 0.3

  if self.time > 0.31 then
    self.time = self.time / 1.1
  end

  audio.dodge:play()
end
