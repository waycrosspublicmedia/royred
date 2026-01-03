setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'bf-redux')

function onGameOverStart()
makeLuaSprite('blueScreen', 'gameOver/BlueScreen', 20, 200)
scaleObject('blueScreen',1.25, 1.25,false)
addLuaSprite('blueScreen')

makeLuaSprite('message', 'gameOver/ErrorMessage', 150, 300)
scaleObject('message',1.25, 1.25,false)
addLuaSprite('message')

makeLuaSprite('crack', 'gameOver/Crack', 20, 200)
scaleObject('crack',1.25, 1.25,false)
addLuaSprite('crack')

setPropertyFromClass('substates.GameOverSubstate', 'instance.boyfriend.x',1250)
setPropertyFromClass('substates.GameOverSubstate', 'instance.boyfriend.y',490)
callMethod('camGame.snapToTarget', {''})

end

function onGameOver()
setProperty('isCameraOnForcedPos', true)
setProperty('camGame.scroll.x',345)
callMethod("camGame.scroll.set", {350,20})
setProperty('camGame.zoom', 0.9)
end