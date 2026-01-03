playVideo=true
d='stages/MANIFEST/2/'
errorPositions = {}
function onStartCountdown()
addCharacterToList("sky-goat-redux", "dad")
precacheImage(d..'Red Screen')
precacheImage(d..'CrackedWall')
precacheImage(d..'CrackedWall_error (Add)')
precacheImage(d..'Error_1')
precacheImage(d..'Error_2')
precacheImage(d..'Error_3')
precacheImage(d..'Bg_spikes')
precacheImage(d..'Ground')
precacheImage(d..'Glow (Add)')
precacheImage(d..'Red_atomsphere (Screen)')
precacheImage(d..'Glow (Screen)')
if playVideo and not seenCutscene then
startVideo(flashingLights and 'manifest' or 'manifest-nonflashing')
playVideo = false
return Function_Stop
end
end

function onStepHit()
if curStep==1864 then
makeLuaSprite('redBG', 'stages/MANIFEST/2/Red Screen', -1037, -666)
scaleObject('redBG', 2.5, 2.5)
setScrollFactor('redBG', 0.4, 1)
addLuaSprite('redBG')

makeLuaSprite('crackedWall', 'stages/MANIFEST/2/CrackedWall', -1037, -666)
scaleObject('crackedWall', 2.5, 2.5)
setScrollFactor('crackedWall', 0.4, 1)
addLuaSprite('crackedWall')

makeLuaSprite('crackedWallCode', 'stages/MANIFEST/2/CrackedWall_error (Add)', -1044, -647)
scaleObject('crackedWallCode', 2.5, 2.5)
setScrollFactor('crackedWallCode', 0.4, 1)
setBlendMode('crackedWallCode', 'add')
addLuaSprite('crackedWallCode')

makeLuaSprite('error1', 'stages/MANIFEST/2/Error_1', 1529, -200)
scaleObject('error1', 0.9, 0.9)
setScrollFactor('error1', 0.6, 0.6)
addLuaSprite('error1')

makeLuaSprite('error2', 'stages/MANIFEST/2/Error_2', 1134, -100)
scaleObject('error2', 1.05, 1.05)
setScrollFactor('error2', 0.9, 0.9)
addLuaSprite('error2')

makeLuaSprite('error3', 'stages/MANIFEST/2/Error_3', -444, -300)
scaleObject('error3', 1, 1)
setScrollFactor('error3', 0.8, 0.8)
addLuaSprite('error3')

makeLuaSprite('bg spikes', 'stages/MANIFEST/2/Bg_spikes', -578)
scaleObject('bg spikes', 1.83, 1.83)
setScrollFactor('bg spikes', 0.7, 1)
addLuaSprite('bg spikes')

makeLuaSprite('ground', 'stages/MANIFEST/2/Ground', -720, -200)
scaleObject('ground', 2, 2)
setScrollFactor('ground', 1, 1)
addLuaSprite('ground')

makeLuaSprite('groundGlow', 'stages/MANIFEST/2/Glow (Add)', -100, 700)
scaleObject('groundGlow', 2, 2)
setScrollFactor('groundGlow', 1, 1)
setBlendMode('groundGlow', 'add')
addLuaSprite('groundGlow')

makeLuaSprite('atmosphere', 'stages/MANIFEST/2/Red_atomsphere (Screen)', -582, -11)
scaleObject('atmosphere', 1.83, 1.83)
setScrollFactor('atmosphere', 1, 1)
setBlendMode('atmosphere', 'screen')
addLuaSprite('atmosphere')

makeLuaSprite('glowscreen', 'stages/MANIFEST/2/Glow (Screen)', -985, -749)
scaleObject('glowscreen', 2.5, 2.5)
setScrollFactor('glowscreen', 1, 1)
setBlendMode('glowscreen', 'screen')
addLuaSprite('glowscreen')

setProperty('shiftWall.visible',false)
setProperty('shiftWallCode.visible',false)
setProperty('shiftGround.visible',false)
setProperty('shiftGroundCode.visible',false)
setProperty('lighting.visible',false)
setProperty('crack1.visible',false)
setProperty('crack2.visible',false)
setProperty('spikes1.visible',false)
setProperty('spikes2.visible',false)
setProperty('defaultCamZoom',0.6)
cameraFlash('game','FFFFFF',0.5)
cameraShake('game', 0.01, 0.3)
triggerEvent("Change Character", "dad", "sky-goat-redux")

for i = 1, 3 do
errorPositions[i] = getProperty('error'..i..'.y')
end

setSpriteShader('dad', 'adjustColor')
if shadersEnabled then
for _,xx in pairs({'boyfriend','dad','gf'}) do
setShaderFloat(xx,'hue',-10)
setShaderFloat(xx,'saturation',5)
setShaderFloat(xx,'contrast',0)
setShaderFloat(xx,'brightness',-5)
end
end
elseif curStep==3350 then
cameraFade('game','000000',3,true)
end
end

stageTime = 0
function onUpdate(elapsed)
stageTime = stageTime + elapsed
if luaSpriteExists('error1') and luaSpriteExists('error2') and luaSpriteExists('error3') then
local errors = {'error1', 'error2', 'error3'}
for i = 1, #errors do
if getProperty(errors[i]..'.y') then
local newY = math.cos(stageTime + (i-1)) * 60 + errorPositions[i] + 100
setProperty(errors[i]..'.y', newY)
end
end
end

if flashingLights and getProperty('crackedWallCode.alpha')>0 and luaSpriteExists('crackedWallCode') then
setProperty('crackedWallCode.alpha', getProperty('crackedWallCode.alpha') - 1.2 * elapsed)
end
end

function onBeatHit()
if not flashingLights then return end
if curBeat % 2 == 0 then
setProperty('crackedWallCode.alpha', 1)
end
end