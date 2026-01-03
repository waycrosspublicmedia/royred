result=false
isRedux = (songName =='Manifest')
sprPath = ''
musicPath = ''

function onEndSong()
if not result then
result=true
rank = getProperty('ratingPercent')

if rank ==1 then
sprPath = isRedux and 'endings/redux-end-nut' or 'endings/classic-end-nut'
musicPath = 'manifest/manifest'
elseif rank >=0.8 then
sprPath = isRedux and 'endings/redux-end-good' or 'endings/classic-end-good'
musicPath = 'manifest/goodEnding'
else
sprPath = isRedux and 'endings/redux-end-bad' or 'endings/classic-end-bad'
musicPath = 'manifest/badEnding'
end


makeLuaSprite('screen', sprPath)
screenCenter('screen')
addLuaSprite('screen', true)
setProperty('screen.alpha', 0)
setObjectCamera('screen','camOther')

makeLuaText('enterTxt', isRedux and 'Tap to continue' or 'Press Enter to continue')
setTextFont('enterTxt', isRedux and 'sky.ttf' or 'vcr.ttf')
setTextSize('enterTxt', 30)
setTextColor('enterTxt', isRedux and '00e4ff' or 'FFFFFF')
setTextAlignment('enterTxt', isRedux and 'center' or 'right')
screenCenter('enterTxt', 'x')
setProperty('enterTxt.y', getProperty('screen.height') - 60)
addLuaText('enterTxt')
setObjectCamera('enterTxt','camOther')
setProperty('enterTxt.alpha', 0)
    
if isRedux then
makeLuaSprite('title', 'endings/reduxtitle',0,50)
screenCenter('title', 'x')
addLuaSprite('title', true)
setProperty('title.alpha', 0)
setObjectCamera('title','camOther')

local subText = ''
if rank == 'SFC' then
subText = 'peanut bf.'
elseif rank == 'GFC' or rank == 'FC' then
subText = "YOU DEFEAT THE FANGIRL AND TAKE YOUR GIRLFRIEND OUT OF THE MANIFEST TO GO HOME FOR WENDY'S"
else
subText = "THE FANGIRL KILLS YOUR GIRLFRIEND IN COLD BLOOD. I GUESS YOU WON'T BE HAVING PROM THIS YEAR... OR ANY OF THE YEARS FOLLOWING IT."
end
        
makeLuaText('subText', subText, 1000, 0, 540)
setTextFont('subText', 'Eina01-SemiBold.otf')
setTextSize('subText', 30)
setTextColor('subText', 'FFFFFF')
setTextAlignment('subText', 'center')
screenCenter('subText', 'x')
addLuaText('subText')
setTextBorder('subText')
setProperty('subText.alpha', 0)
setObjectCamera('subText','camOther')
end
    
doTweenAlpha('screenFade', 'screen', 1, 2)

if isRedux then
doTweenAlpha('titleFade', 'title', 1, 2)
doTweenAlpha('subFade', 'subText', 1, 2)
end

runTimer('showEnter', 2)
playSound(musicPath)
return Function_Stop
end
end

function onTimerCompleted(t)
if t == 'showEnter' then
doTweenAlpha('enterFade', 'enterTxt', 1, 1)
end
end

function onUpdate()
if result and (getProperty('controls.ACCEPT') or mouseClicked()) then
endSong()
end
end