transCounter = 1

function opponentNoteHit(_,d,n)
if n == 'mom' then
playAnim('dad', 'trans'..transCounter, true)
setProperty('dad.specialAnim',true)
transCounter = transCounter + 1
cameraFlash('game', '000000', 0.1)

elseif n == 'ugh' then
playAnim('dad', getProperty('singAnimations['..d..']')..'-alt', true)
setProperty('dad.holdTimer', 0)
end
end