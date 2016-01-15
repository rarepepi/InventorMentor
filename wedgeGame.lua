local composer = require( "composer" )
local scene = composer.newScene()

local physics = require( "physics" );
physics.start()

local widget = require( "widget" )

halfW = display.contentWidth*0.5
halfH = display.contentHeight*0.5

centerX = display.contentCenterX
centerY = display.contentCenterY

actualW = display.actualContentWidth
actualH = display.actualContentHeight

actualWD2 = display.actualContentWidth/2
actualHD2 = display.actualContentHeight/2

display.setStatusBar(display.HiddenStatusBar);

function scene:create( event )
    local sceneGroup = self.view

    local BG = display.newImage("leverImages/leverBackground.jpg", centerX, centerY)
    sceneGroup:insert( BG )


	local menuButton = display.newText ("Back", 250 , 500, native.systemFontBold, 20)
	menuButton:setTextColor( 1, 1, 0 )
	sceneGroup:insert(menuButton)
	local function gotoMenu(event)
	    if event.phase == "ended" then 
	    	composer.gotoScene( "Gamemenu", { time = 500, effect = "zoomOutInFade" })
	    end
	end

	menuButton:addEventListener( "touch", gotoMenu )


	avalableFracs = {"27", "46", "102", "208", "198", "16", "38"}
	avalableLength = {"81", "92", "408", "624", "990", "96", "266"}	
	avalableHeight = {"3", "2", "4", "3", "5", "6", "7"}

	randomFrac =  math.random( #avalableFracs ) 

	hearts = 3
	scoreTxt = display.newText( "Gizmos: ", 45, 500, native.systemFontBold, 20)
	scoreTxt:setTextColor( 0, .25, 0 )
	sceneGroup:insert( scoreTxt )
	
	scoreText = display.newText(hearts, 90, 500, native.systemFontBold, 20)
	scoreText:setTextColor( 0, .25, 0 )
	sceneGroup:insert( scoreText )

	fraction = "Length: " .. avalableLength[randomFrac] .. "  Height: " .. avalableHeight[randomFrac]
	fractionText = display.newText(fraction, 110, -30,  native.systemFontBold, 20)
	fractionText:setTextColor( 0, .25, 0 )
	sceneGroup:insert( fractionText )

	function addNewGearWedge()
	    local startX = math.random(display.contentWidth*0.1,display.contentWidth*0.9)
	    if(math.random(1,7)==1) then
	        -- Wrong gear
	        Torx = display.newImage( "wedgeImages/wedge27.png", startX, -300)
	        sceneGroup:insert( Torx )
	        Torx:toBack()
	        BG:toBack()
	        Torx.varcheck = "27"
	        local initial = randomFrac

	        physics.addBody( Torx )
	        Torx.linearDamping = 5
	        Torx.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Torx )
	        Torx:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==2) then
	        -- Wrong gear
	        Spline = display.newImage( "wedgeImages/wedge46.png", startX, -300)
	        sceneGroup:insert( Spline )
	        Spline:toBack()
	        BG:toBack()
	        Spline.varcheck = "46"
	        local initial = randomFrac

	        physics.addBody( Spline )
	        Spline.linearDamping = 5
	        Spline.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Spline )
	        Spline:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==3) then
	        -- Wrong gear
	        Hex = display.newImage( "wedgeImages/wedge102.png", startX, -300)
	        sceneGroup:insert( Hex )
	        Hex:toBack()
	        BG:toBack()
	       	Hex.varcheck = "102"
	       	local initial = randomFrac

	        physics.addBody( Hex )
	        Hex.linearDamping = 5
	        Hex.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Hex )
	        Hex:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==4) then
	        -- Correct Gear
	        Allen = display.newImage( "wedgeImages/wedge208.png", startX, -300)
	        sceneGroup:insert( Allen )
	        Allen:toBack()
	        BG:toBack()
	        Allen.varcheck = "208"
	        local initial = randomFrac

	        physics.addBody( Allen )
	        Allen.linearDamping = 5
	        Allen.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Allen  )
	        Allen:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==5) then
	        -- Wrong gear
	        Phillips = display.newImage( "wedgeImages/wedge198.png", startX, -300)
	        sceneGroup:insert( Phillips )
	        Phillips:toBack()
	        BG:toBack()
	        Phillips.varcheck = "198"
	        local initial = randomFrac

	        physics.addBody( Phillips )
	        Phillips.linearDamping = 5
	        Phillips.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Phillips )
	        Phillips:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==6) then
	        -- Wrong gear
	        Square = display.newImage( "wedgeImages/wedge16.png", startX, -300)
	        sceneGroup:insert( Square )
	        Square:toBack()
	        BG:toBack()
	        Square.varcheck = "16"
	        local initial = randomFracs
	        physics.addBody( Square )
	        Square.linearDamping = 5
	        Square.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Square )
	        Square:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==7) then
	        -- Wrong gear
	        Flat = display.newImage( "wedgeImages/wedge38.png", startX, -300)
	        sceneGroup:insert( Flat )
	        Flat:toBack()
	        BG:toBack()
	        Flat.varcheck = "38"
	        local initial = randomFrac

	        physics.addBody( Flat )
	        Flat.linearDamping = 5
	        Flat.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Flat )
	        Flat:addEventListener( "touch", checkGear )
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

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "did" ) then


		function correctGearTouched(event)
			if ( event.phase == "began" ) then
				-- This removes the feature of lua checking for the gear every frame which eats up memory
				Runtime:removeEventListener( "enterFrame", event.self )
				--This will delete the gear after it was fallen of the screen
				event.target:removeSelf()
				hearts = hearts + 1
				scoreText.text = hearts
				randomFrac = math.random( #avalableFracs ) 
				fractionText.text = "Length: " .. avalableLength[randomFrac] .. "  Height: " .. avalableHeight[randomFrac]
			end
		end
		
		function wrongGearTouched(event)
			if ( event.phase == "began" ) then
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
	addingofNewGearswedge = timer.performWithDelay( 2750, addNewGearWedge, 0)	
end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( event.phase == "will" ) then
    	display.remove( Torx )
    	display.remove( Spline )
    	display.remove( Hex )
    	display.remove( Allen )
    	display.remove( Phillips )
    	display.remove( Flat )
    	display.remove( Square )


    end
end
scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

return scene