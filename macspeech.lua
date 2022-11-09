local objc = require("objc.objc")

objc.load("AVFoundation")
local backend = {}
backend.synth = objc.AVSpeechSynthesizer:alloc():init()
-- Because AVSpeechSynthesizer doesn't give us the proper default voice (it returned ALbert on my system for some reason), we have to do this bit of uglyness with NSSpeechSynthesizer.
backend.voice = objc.NSSpeechSynthesizer:alloc():init():defaultVoice()

function backend.output(text, interrupt)
	text = tostring(text)
	interrupt = interrupt or false
	if interrupt then
		backend.synth:stopSpeakingAtBoundary(0)
	end
	local utterance = objc.AVSpeechUtterance:alloc():initWithString(text)
	utterance.voice = objc.AVSpeechSynthesisVoice:voiceWithIdentifier(backend.voice)
	backend.synth:speakUtterance(utterance)
end

function backend.isSpeaking()
	return backend.synth:isSpeaking()
end

return backend
