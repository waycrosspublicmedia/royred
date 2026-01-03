function opponentNoteHit(_,d,n)
if n == 'mom' then
playAnim('dad', getProperty('singAnimations['..d..']')..'-alt', true)
setProperty('dad.holdTimer', 0)

elseif n == 'ugh' then
playAnim('dad', getProperty('singAnimations['..d..']')..'-sad', true)
setProperty('dad.holdTimer', 0)
end
end