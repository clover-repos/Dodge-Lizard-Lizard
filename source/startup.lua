windowWidth, windowHeight = love.graphics.getDimensions() --Size of game (STARTUP COPY)

score = 0
highScore = 0

sky = {}

sky.image = love.graphics.newImage("art/sky.png")
sky.offX = 0


forgeground = {}

forgeground.image = love.graphics.newImage("art/forgeground.png")
forgeground.offX = 0


baton = require("lib.baton")
require("source.input")

require("source.scale")
require("source.camera")
require("source.entities.entity")
require("source.titlescreen")
require("source.audio")
require("source.dodge")
require("source.eat")


entities:load()
titlescreen:load()

font = love.graphics.newFont("fonts/dpcomic.ttf", 38)
love.graphics.setFont(font)

love.mouse.setVisible(false)
love.window.setMode(800, 450) --16x9 aspect ratio
