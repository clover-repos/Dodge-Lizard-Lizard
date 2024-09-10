audio = {}

audio.start = love.audio.newSource("audio/confirm.ogg", "static")
audio.death = love.audio.newSource("audio/falling.ogg", "static")

audio.dodge = love.audio.newSource("audio/confirm.ogg", "static")
audio.dodge:setPitch(2)

function audio:newSong(song)
  if audio.theme then audio.theme:stop() end

  self.theme = love.audio.newSource("audio/" .. song ..".ogg", "stream")
  self.theme:setLooping(true)
  self.theme:play()
end
