eat = {}

eat.drawTime = 0
eat.coolDown = 0
eat.timer = 0

eat.bugList = {
  love.graphics.newImage("art/bugs/Ladybug.png"),
  love.graphics.newImage("art/bugs/Beetle.png")
}

function eat:update(dt)
  if inputs:pressed "up" and self.coolDown <= 0 then
    player.frame = 4
    player.animTimer = 0.25

    self.coolDown = 0.75

    if self.timer > 0 then
      score = score + 0.5

      self.drawTime = 0.01
    end
  end

  if self.coolDown > 0 then self.coolDown = self.coolDown - dt end
  if self.timer > 0 then self.timer = self.timer - dt end
end

function eat:draw()
  if self.drawTime > 0 then
    if gamestate == "playstate" then
      self.drawTime = self.drawTime - publicDT
      self.bugX = self.bugX + 100 * publicDT
      if self.drawTime < 0.25 then
        self.bugY = self.bugY + 100 * publicDT
      else
        self.bugY = self.bugY - 100 * publicDT
      end
    end

    love.graphics.draw(self.bug, self.bugX, self.bugY, nil, 3)

    love.graphics.setColor(0, 0.25, 1)
      love.graphics.print("Eat!", 400, 100)
    love.graphics.setColor(1, 1, 1)
  end
end

function eat:startDraw()
  audio.dodge:play()
  self.drawTime = 0.5
  eat.bug = eat.bugList[math.random(1, #eat.bugList)] --Bug types

  self.bugX = 470
  self.bugY = 200
end
