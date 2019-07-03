----------------------------------------------------------------------------------------
--
-- main.lua María José Olivares. Agbo Training
--
-----------------------------------------------------------------------------------------

local physics = require("physics")

physics.start( )


local centerX = display.contentCenterX
local centerY = display.contentCenterY


local _W = display.contentWidth
local _H = display.contentHeight

display.setStatusBar( display.HiddenStatusBar )




--fondo
local bkg = display.newImage( "background.png", centerX, centerY )
bkg:scale(display.contentWidth/bkg.contentWidth, display.contentHeight/bkg.contentHeight)
bkg.x = display.contentWidth/2
bkg.y = display.contentHeight/2


--geek
local geek = display.newImage( "superGeek.png", centerX-150, centerY+30)

physics.addBody( geek, "dynamic" ,{density=0.6, friction=0.2, bounce=0.2} )

--suelo
local floor1 = display.newRect(centerX, _H - 1, _W, 2)

physics.addBody( floor1, "static" ,{density=1, friction=0.6, bounce=0} )

--pared izquierda
local wall_iz = display.newRect(1, _H/2, 2, _H)

physics.addBody( wall_iz, "static" ,{density=1, friction=0.6, bounce=0} )

--pared derecha
local wall_dr = display.newRect(_W-1, _H/2, 2, _H )

physics.addBody( wall_dr, "static" ,{density=1, friction=0.6, bounce=0} )

--num torres
for i=1, 4 do

 -- num bloques torres
 for j=1, i do

 	--bloques

    local crate = display.newImage( "crate2.png", centerX -60 + 60*i  , centerY  - j* 60)

    physics.addBody( crate, "dynamic", {density= 0.5, friction=1, bounce=0  } )


 end

    --hipster

    local hipster = display.newImage( "Hipster.png",centerX -60 + 60*i, centerY-30-5*62)
 
 	physics.addBody( hipster, "dynamic" ,{density=1, friction=0.9, bounce=0.1} )


end


--gestion de eventos
function geekTouched(event)

if event.phase == "began" then
	display.getCurrentStage( ):setFocus(geek)
elseif event.phase == "ended" then
    	geek:applyLinearImpulse( event.xStart - event.x , event.yStart - event.y, geek.x, geek.y)
    	display.getCurrentStage( ):setFocus( nil)
	    end
end


geek:addEventListener( "touch", geekTouched )