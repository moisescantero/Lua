-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------
local physics =require "physics"

physics.start( )

local centerX = display.contentCenterX
local centerY = display.contentCenterY

local ancho = display.contentWidth
local alto = display.contentHeight

--pelota
local pelota = display.newCircle( 65, 170, 15 )

physics.addBody( pelota, "dynamic", {density=0.9, friction=0.2, bounce=0.7  } )

--plataforma1
local plataforma = display.newRect( ancho/4, centerY, ancho/2, 10 )

physics.addBody( plataforma, "static", {density=0.9, friction=0.1, bounce=0.8  } )

--bloques en plataforma1
for i=1, 3 do

local bloque = display.newRect( ancho/4 +50, centerY -220 + 50*i, 30, 30 )

physics.addBody( bloque, "dynamic", {density=0.5, friction=0.2, bounce=0.2 } )

end

local suelo = display.newRect( centerX, alto, ancho, 10 )

physics.addBody( suelo, "static", {density=0.9, friction=0.1, bounce=0.8 })


function circleTouched(event)

if event.phase == "began" then
	display.getCurrentStage( ):setFocus(pelota)
	elseif event.phase == "ended" then
    	pelota:applyLinearImpulse( event.xStart - event.x , event.yStart - event.y, pelota.x, pelota.y)
    	display.getCurrentStage( ):setFocus( nil)
	end
end

pelota:addEventListener( "touch", circleTouched )




