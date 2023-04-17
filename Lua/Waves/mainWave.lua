local framerate = 30
local bands = 4

local badApple = CreateSprite("0", "Top")
badApple.shader.Set("badapple", "bandChooser")
Audio.LoadFile("badapple")

local floor = math.floor
local setFrame = badApple.Set
local setFloat = badApple.shader.SetFloat
local drawBand = function(band) setFloat("band", band) end

function Update()
    local curFrame = floor(Time.wave * framerate)
    local curPackedFrame = tostring(floor(curFrame / bands))
    local curBand = curFrame % bands
    DEBUG("frame "..tostring(curFrame).."; "..curPackedFrame..".png; band "..tostring(curBand))
    if (curBand == 0) then
        setFrame(curPackedFrame)
    end
    drawBand(curBand)
end