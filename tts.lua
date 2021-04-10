
local os=love.system.getOS()
if os =="Windows" then
    backend=require "Tolk"
    backend.trySAPI(true)
elseif os=="OS X" then
    backend=require "macspeech"
end

local function say(text, interrupt)
    interrupt=interrupt or false
    backend.output(text, interrupt)
end

local function isSpeaking()
    return backend.isSpeaking()
end

return {say=say, isSpeaking=isSpeaking}



