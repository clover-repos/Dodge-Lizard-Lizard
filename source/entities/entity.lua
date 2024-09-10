entities = {}


function entities:load()
  require("source.entities.player")
  require("source.entities.ground")
  require("source.entities.eagle")

  player:load()
end

function entities:update(dt)
  player:update(dt)
  eagle:update(dt)


  ground:update(dt)

  ground.update(sky, dt, 95)
  ground.update(foreground, dt, 300, 1600)
end

function entities:draw()
  player:draw()
  eagle:draw()
end
