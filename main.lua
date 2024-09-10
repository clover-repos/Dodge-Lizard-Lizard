function love.load()
    math.randomseed(os.time()) --Always get a new random seed so nothing repeats
    love.graphics.setDefaultFilter("nearest", "nearest") --Makes pixel art not blurr

    require("source.startup") --Imports extra stuff for the game
    startUp() --Calls startup file's function
end

function love.update(dt)
  if dt > 0.1 then dt = 0.1 end --Update cap, fixes lag bugs
  publicDT = dt --For draw based timers

  windowWidth, windowHeight = love.graphics.getDimensions() --Size of game
  inputs:update() --Input wrapper updates

  if gamestate ~= "death" then
    if audio.theme and not audio.theme:isPlaying() then
      audio.theme:play()
    end
  end

  if gamestate == "playstate" then
    entities:update(dt) --Player, and enemies update
    camera:update(dt) --From eating to bird-dodging..
  elseif gamestate == "titlescreen" then
    titlescreen:update(dt)
  elseif gamestate == 'death' then
    if inputs:released "action" then
      love.timer.sleep(0.35)
      score = 0

      gamestate = "playstate"

      audio.theme:play()
      audio.start:play()
    end
  else
    ground.update(sky, dt, 40)
  end

  if inputs:pressed "action" then
    if gamestate == "playstate" then
      gamestate = 'idle'

      audio.death:play()
    elseif gamestate == "idle" then
      gamestate = 'playstate'

      audio.start:play()
    end
  end

  if highScore and highScore > 0 then
    highString = "\n  ...Your high score is: " .. highScore .. "\n  And your score was: " .. score
  else
    highString = ""
  end

end

function love.draw()
  love.graphics.setBackgroundColor(0.1, 0.31, 0.3) --Background

  if gamestate == "playstate" or gamestate == "idle" then
    camera:attach()
      love.graphics.draw(sky.image, 0 - sky.offX, -285, nil, 10)

      entities:draw() --Draws player, and enemies

      love.graphics.draw(ground.image, 0 - ground.offX, 230, nil, 10)
    camera:detach()

    love.graphics.draw(foreground.image, 0 - foreground.offX, 350 + camera.y / 2, nil, 10)


    dodge:draw()
    eat:draw()


    love.graphics.setColor(0.1, 0.05, 0.0)

    love.graphics.print("Score: " .. score, 2)

    if highScore and highScore > 0 then
      love.graphics.print("High score: " .. highScore, 2, 35)
    end

    love.graphics.setColor(1, 1, 1)
  elseif gamestate == "titlescreen" then
    titlescreen:draw()
  else
    love.graphics.print("You got eaten." .. highString, 265, 300)
  end
end
