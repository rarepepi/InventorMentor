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

    BG = display.newImage("leverImages/leverBackground.jpg", centerX, centerY)
    sceneGroup:insert( BG )

	local menuButton = display.newText ("Back", 250 , 500, native.systemFontBold, 20)
	menuButton:setTextColor( 1, 1, 0 )
	sceneGroup:insert( menuButton )

	local function gotoGamemenu(event)
		if event.phase == "ended" then 
		    composer.gotoScene( "Gamemenu", { time = 500, effect = "zoomOutInFade" })
		end
	end

	menuButton:addEventListener( "touch", gotoGamemenu )

	
	avalableFracs = {"100", "50", "10", "500", "80", "55", "77"}
	avalableBase = {"20", "50", "20", "250", "40", "10", "14"}	
	avalableHeight = {"10", "2", "1", "4", "4", "11", "11"}


	randomFrac =  math.random( #avalableFracs ) 

	hearts = 3
	scoreTxt = display.newText( "Gizmos: ", 45, 500, native.systemFontBold, 20)
	scoreTxt:setTextColor( 0, .25, 0 )
	sceneGroup:insert( scoreTxt )
	scoreText = display.newText(hearts, 90, 500, native.systemFontBold, 20)
	scoreText:setTextColor( 0, .25, 0 )
	sceneGroup:insert( scoreText )

	fraction = "Base: " .. avalableBase[randomFrac] .. "  Height: " .. avalableHeight[randomFrac]
	fractionText = display.newText(fraction, 100, -30,  native.systemFontBold, 20)
	fractionText:setTextColor( 0, .25, 0 )
	sceneGroup:insert( fractionText )

	function addNewGear()
	    local startX = math.random(display.contentWidth*0.1,display.contentWidth*0.9)
	    if(math.random(1,7)==1) then
	        -- Wrong gear
	        Torx = display.newImage( "planeImages/triangle100.png", startX, -100)
	        sceneGroup:insert( Torx )
	        Torx:toBack()
	        BG:toBack()
	        Torx.varcheck = "100"
	        local initial = randomFrac

	        physics.addBody( Torx )
	        Torx.linearDamping = 5
	        Torx.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Torx )

	        Torx:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==2) then
	        -- Wrong gear
	        Spline = display.newImage( "planeImages/triangle50.png", startX, -100)
	        sceneGroup:insert( Spline )
	        Spline:toBack()
	        BG:toBack()
	        Spline.varcheck = "50"
	        local initial = randomFrac

	        physics.addBody( Spline )
	        Spline.linearDamping = 5
	        Spline.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Spline )
	        Spline:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==4) then
	        -- Correct Gear
	        Allen = display.newImage( "planeImages/triangle500.png", startX, -100)
	        sceneGroup:insert( Allen )
	        Allen:toBack()
	        BG:toBack()
	        Allen.varcheck = "500"
	        local initial = randomFrac

	        physics.addBody( Allen )
	        Allen.linearDamping = 5
	        Allen.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Allen  )
	        Allen:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==5) then
	        -- Wrong gear
	        Phillips = display.newImage( "planeImages/triangle80.png", startX, -100)
	        sceneGroup:insert( Phillips )
	        Phillips:toBack()
	        BG:toBack()
	        Phillips.varcheck = "80"
	        local initial = randomFrac

	        physics.addBody( Phillips )
	        Phillips.linearDamping = 5
	        Phillips.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Phillips )
	        Phillips:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==6) then
	        -- Wrong gear
	        Square = display.newImage( "planeImages/triangle55.png", startX, -100)
	        sceneGroup:insert( Square )
	        Square:toBack()
	        BG:toBack()
	        Square.varcheck = "55"
	        local initial = randomFrac

	        physics.addBody( Square )
	        Square.linearDamping = 5
	        Square.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Square )

	        Square:addEventListener( "touch", checkGear )
	    end
	    if(math.random(1,7)==7) then
	        -- Wrong gear
	        Flat = display.newImage( "planeImages/triangle77.png", startX, -100)
	        sceneGroup:insert( Flat )
	        Flat:toBack()
	        BG:toBack()
	        Flat.varcheck = "77"
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
				fractionText.text = "Base: " .. avalableBase[randomFrac] .. "  Height: " .. avalableHeight[randomFrac]
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
	addingofNewGears = timer.performWithDelay( 2750, addNewGear, 0)
end
end

function scene:hide( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( event.phase == "will" ) then
    	display.remove( Torx )
    	display.remove( Spline )
    	display.remove( Allen )
    	display.remove( Phillips )
    	display.remove( Square )
    	display.remove( Flat )


    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

return scene