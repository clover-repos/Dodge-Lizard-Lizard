gameWidth, gameHeight = 800, 600

function findScale()
  local gameAspect = gameWidth / gameHeight

  local windowAspect = windowWidth / windowHeight

  local scaleX, scaleY

  if gameAspect > windowAspect then
      scaleX = windowWidth / gameWidth
      scaleY = scaleX
  else
      scaleY = windowHeight / gameHeight
      scaleX = scaleY
  end


  --Center the game content
  local offsetX = (windowWidth - gameWidth * scaleX) / 2
  local offsetY = (windowHeight - gameHeight * scaleY) / 2

  local scaledGameWidth = gameWidth * scaleX
  local scaledGameHeight = gameHeight * scaleY
  local barWidth = (windowWidth - scaledGameWidth) / 2
  local barHeight = (windowHeight - scaledGameHeight) / 2

  return offsetX, offsetY, scaleX, scaleY, barWidth, barHeight, scaledGameWidth, scaledGameHeight
end

function applyCrop(barWidth, barHeight, scaledGameWidth, scaledGameHeight)
  love.graphics.setColor(0, 0, 0)

  love.graphics.rectangle("fill", 0, 0, windowWidth, barHeight)
  love.graphics.rectangle("fill", 0, windowHeight - barHeight, windowWidth, barHeight)
  love.graphics.rectangle("fill", 0, 0, barWidth, windowHeight)
  love.graphics.rectangle("fill", windowWidth - barWidth, 0, barWidth, windowHeight)

  love.graphics.setColor(1, 1, 1)
end
