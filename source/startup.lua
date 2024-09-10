windowWidth, windowHeight = love.graphics.getDimensions() --Size of game (STARTUP COPY)

score = 0
highScore = 0

sky = {}

sky.image = love.graphics.newImage("art/sky.png")
sky.offX = 0


foreground = {}

foreground.image = love.graphics.newImage("art/foreground.png")
foreground.offX = 0


function startUp()
  baton = require("lib.baton")
  require("source.input")

  require("source.camera")
  require("source.entities.entity")
  require("source.titlescreen")
  require("source.audio")
  require("source.dodge")
  require("source.eat")


  entities:load()
  titlescreen:load()
end

font = love.graphics.newFont("fonts/dpcomic.ttf", 38)
love.graphics.setFont(font)

love.mouse.setVisible(false)
