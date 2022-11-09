local objc = require("objc.objc")

objc.load("AVFoundation")
local backend = {}
backend.synth = objc.AVSpeechSynthesizer:alloc():init()

function backend.output(text, interrupt)
	text = tostring(text)
	interrupt = interrupt or false
	if interrupt then
		backend.synth:stopSpeakingAtBoundary(0)
	end
	local utterance = objc.AVSpeechUtterance:alloc():initWithString(text)
	backend.synth:speakUtterance(utterance)
end

function backend.isSpeaking()
	return backend.synth:isSpeaking()
end

return backend
