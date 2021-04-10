
objc=require "objc"
local synth=objc.NSSpeechSynthesizer:alloc():init()
local function output(text)
    if type(text) ~="string" then
        text=tostring(text)
    end
    synth:startSpeakingString(text) 
end
return {output=output}

