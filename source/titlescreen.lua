titlescreen = {}

function titlescreen:load()
  gamestate = "titlescreen"

  audio:newSong("mushroom_dance2")
end

function titlescreen:update(dt)
  if inputs:released "action" then
    love.timer.sleep(0.35)

    gamestate = "playstate"

    audio:newSong("mushroom_dance")
    audio.start:play()
  end
end

function titlescreen:draw()
  love.graphics.setColor(0.1, 0.1, 0.2)
    love.graphics.rectangle("fill", 0, 0, windowWidth, windowHeight)
  love.graphics.setColor(1, 1, 1)

  love.graphics.print("Start game...\n\nControlls:\nDown is dodge!\nUp is eat!", 10, 10)
end
