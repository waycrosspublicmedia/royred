playVideo=true
function onStartCountdown()
if playVideo and not seenCutscene then
startVideo(flashingLights and 'wf' or 'wf-nonflashing')
playVideo = false
return Function_Stop
end
setProperty('camHUD.alpha',0)
setProperty('camGame.alpha',0)
callMethod('camFollow.setPosition', {1700,400})
end

function onSongStart()
setProperty('camHUD.alpha',1)
setProperty('camGame.alpha',1)
end