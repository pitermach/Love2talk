
objc=require "objc/objc"
local synth=objc.NSSpeechSynthesizer:alloc():init()
local function output(text)
    if type(text) ~="string" then
        text=tostring(text)
    end
    synth:startSpeakingString(text)
end
local function isSpeaking()
    if synth:isSpeaking()==1 then
        return true
    else
        return false
    end
end

return {output=output, isSpeaking=isSpeaking}

