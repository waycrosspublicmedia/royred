playVideo=true
function onStartCountdown()
if playVideo and not seenCutscene then
startVideo(flashingLights and 'sky' or 'sky-nonflashing')
playVideo = false
return Function_Stop
end
end