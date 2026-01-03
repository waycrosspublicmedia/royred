makeAnimatedLuaSprite('hearts', 'stages/WF/hearts',getProperty('dad.x')-75,getProperty('dad.y')+150)
addAnimationByPrefix('hearts', 'loop', 'hearts', 24, true)
addLuaSprite('hearts',true)

function onUpdate()
if stringEndsWith(getProperty('dad.animation.curAnim.name'), 'alt') then
setProperty('hearts.visible', true)
else
setProperty('hearts.visible', false)
end
end

function opponentNoteHit(_,d,n)
if n == 'mom' then
playAnim('dad', getProperty('singAnimations['..d..']')..'-alt', true)
setProperty('dad.holdTimer', 0)
end
end