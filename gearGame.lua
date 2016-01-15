local composer = require( "composer" )
local scene = composer.newScene()

display.setStatusBar(display.HiddenStatusBar);

physics = require( "physics" );
physics.start()

halfW = display.contentWidth*0.5
halfH = display.contentHeight*0.5

centerX = display.contentCenterX
centerY = display.contentCenterY

actualW = display.actualContentWidth
actualH = display.actualContentHeight

actualWD2 = display.actualContentWidth/2
actualHD2 = display.actualContentHeight/2

function scene:create( event )
    local sceneGroup = self.view

    function gotoGamemenu(event)
		if event.phase == "ended" then
	    	composer.gotoScene( "Gamemenu", { time = 500, effect = "fromRight" })
		end
	end

    BG = display.newImage("leverImages/leverBackground.jpg", centerX, centerY)
    sceneGroup:insert( BG )

    menuButton = display.newText("Back", 280 , 500, native.systemFontBold, 20)
	menuButton:setTextColor( 1, 1, 0 )
	sceneGroup:insert( menuButton )
	menuButton:addEventListener( "touch", gotoGamemenu )


	avalableFracs = {"1/2", "1/3", "1/4", "1/5"}
	randomFrac = math.random( #avalableFracs ) 

	hearts = 3
	scoreTxt = display.newText( "Gizmos: ", 45, 500, native.systemFontBold, 20)
	scoreTxt:setTextColor( 0, .25, 0 )
	sceneGroup:insert( scoreTxt )

	scoreText = display.newText(hearts, 90, 500, native.systemFontBold, 20)
	scoreText:setTextColor( 0, .25, 0 )
	sceneGroup:insert( scoreText )

	fraction = "Basic Ratio: " .. avalableFracs[randomFrac]
	fractionText = display.newText(fraction, 77, -30,  native.systemFontBold, 20)
	fractionText:setTextColor( 0, .25, 0 )
	sceneGroup:insert( fractionText )

	function addNewGear()
	    local startX = math.random(display.contentWidth*0.1,display.contentWidth*0.9)
		if(math.random(1,4)==1) then
		        -- Wrong gear
			local check = math.random( 1,5 )
		    local pics = {"gearImages/gear2_4.png", "gearImages/gear3_6.png", "gearImages/gear4_8.png", "gearImages/gear5_10.png", "gearImages/gear6_12.png"}
		    local image = pics[check]

		    half = display.newImage( image, startX, -100)
		    sceneGroup:insert( half )
		    half:toBack()
		    BG:toBack( )


		    half.varcheck = "1/2"
		    local initial = randomFrac

		    physics.addBody( half, "dynamic" )
		    half.linearDamping = 5
		    half.enterFrame = offscreen
		    Runtime:addEventListener( "enterFrame", half )
		    half:addEventListener( "touch", checkGear )
		    end
		if(math.random(1,4)==2) then
		        -- Wrong gear
		    local check = math.random( 1,5 )
		    local picsthird = {"gearImages/gear2_6.png", "gearImages/gear5_15.png", "gearImages/gear4_12.png", "gearImages/gear3_9.png", "gearImages/gear6_18.png"}
		    local imagethird = picsthird[check]
		    local initial = randomFrac

		    third = display.newImage( imagethird, startX, -100)
		    sceneGroup:insert( third )
		    third:toBack()
		    BG:toBack( )


		    third.varcheck = "1/3"
		    physics.addBody( third )
		    third.linearDamping = 5
		    third.enterFrame = offscreen
		    Runtime:addEventListener( "enterFrame", third )
		    third:addEventListener( "touch", checkGear )
		end
		if(math.random(1,4)==3) then
		        -- Wrong gear
		    local check = math.random( 1,5 )
		    local picsfourth = {"gearImages/gear2_8.png", "gearImages/gear3_12.png", "gearImages/gear4_16.png", "gearImages/gear5_20.png", "gearImages/gear6_24.png"}
		    local imagefourth = picsfourth[check]


		    fourth = display.newImage( imagefourth, startX, -100)
		    sceneGroup:insert( fourth )
		    fourth:toBack()
		    BG:toBack()

		    fourth.varcheck = "1/4"
		  	local initial = randomFrac


		    physics.addBody( fourth )
		    fourth.linearDamping = 5
		    fourth.enterFrame = offscreen
		    Runtime:addEventListener( "enterFrame", fourth )
		    fourth:addEventListener( "touch", checkGear )
		if(math.random(1,4)==4) then
		        -- Correct Gear
		    local check = math.random( 1,5 )
		    local picsfith = {"gearImages/gear2_10.png", "gearImages/gear3_15.png", "gearImages/gear4_20.png", "gearImages/gear5_25.png", "gearImages/gear6_30.png"}
		    local imagefith = picsfith[check]
		
		    fith = display.newImage( imagefith, startX, -100)
		    fithhelper = display.newImage( imagefith, startX -100 )
		    sceneGroup:insert( fith )
		    fith:toBack()
			BG:toBack()
			fithhelper.varcheck = "1/5"

		    fith.varcheck = "1/5"
		  	local initial = randomFrac

		    physics.addBody( fithhelper )
		    fithhelper.linearDamping = 5
		    fithhelper.enterFrame = offscreen
		    Runtime:addEventListener( "enterFrame",  fithhelper )

		    fithhelper:addEventListener( "touch", checkGear)


		    physics.addBody( fith )
		    fith.linearDamping = 5
		    fith.enterFrame = offscreen
		    Runtime:addEventListener( "enterFrame",  fith )

		    fith:addEventListener( "touch", checkGear)
		    end
		end
	end
function checkGear(event)
	if avalableFracs[randomFrac]==event.target.varcheck then
		correctGearTouched(event)
	else
		wrongGearTouched(event)
	end
end
end


function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "will" ) then


	function correctGearTouched(event)
		if event.phase == "began" then
			Runtime:removeEventListener( "enterFrame", event.self )
			event.target:removeSelf()
			hearts = hearts + 1
			scoreText.text = hearts
			randomFrac = math.random( #avalableFracs ) 
			fractionText.text = "Basic Ratio: " .. avalableFracs[randomFrac]
		end
	end
		
	function wrongGearTouched(event)
		if event.phase == "began" then
			Runtime:removeEventListener( "enterFrame", event.self )
			event.target:removeSelf()
			hearts = hearts - 1
			scoreText.text = hearts
		end
	end

		-- Delete objects which has fallen off the bottom of the screen
	function offscreen(self, event)
		   if(self.y == nil) then
		   return
		   end
		   if(self.y > display.contentHeight + 50) then
		        Runtime:removeEventListener( "enterFrame", self )
		        self:removeSelf()
		   end
	end

		-- Add a new falling gear
	
	addingofNewGears = timer.performWithDelay( 2750, addNewGear, 0)
end
end
function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( event.phase == "will" ) then
    	display.remove( half )
    	display.remove( third )
    	display.remove( fourth )
    	display.remove( fith )
    end
end


scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

return scene