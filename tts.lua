
local os=love.system.getOS()
if os =="Windows" then
    backend=require "Tolk"
    backend.trySAPI(true)
elseif os=="OS X" then
    backend=require "macspeech"
end

local function say(text)
    backend.output(text)
end

return {say=say}



