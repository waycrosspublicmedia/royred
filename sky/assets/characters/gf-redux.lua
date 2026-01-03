makeAnimatedLuaSprite('stereo', 'stereo', getProperty('gf.x') - 240, getProperty('gf.y') + 285)
addAnimationByPrefix('stereo', 'idle', 'stereo boom', 24, false)
addLuaSprite('stereo')
setScrollFactor('stereo',0.95,0.95)
setObjectOrder('stereo', getObjectOrder('gfGroup')-1)

function onBeatHit()
playAnim('stereo', 'idle')
end