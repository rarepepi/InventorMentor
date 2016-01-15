local composer = require( "composer" )
local scene = composer.newScene()

local physics = require( "physics" );
physics.start()

display.setStatusBar(display.HiddenStatusBar);

local widget = require( "widget" )

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

	avalableFracs = {"125", "70", "155", "255", "45", "95", "55"}
	avalableFracs2 = {125, 70, 155, 255, 45, 95, 55}

	randomFrac =  math.random( #avalableFracs ) 

	hearts = 3
	scoreTxt = display.newText( "Gizmos: ", 45, 500, native.systemFontBold, 20)
	scoreTxt:setTextColor( 0, .25, 0 )
	sceneGroup:insert( scoreTxt )
	scoreText = display.newText(hearts, 90, 500, native.systemFontBold, 20)
	scoreText:setTextColor( 0, .25, 0 )
	sceneGroup:insert( scoreText )

	RightWieght = 0

	fraction = "Left Weight: " .. avalableFracs[randomFrac] .."    Right Weight: " .. RightWieght
	fractionText = display.newText(fraction, 150, -30, native.systemFontBold, 18)
	fractionText:setTextColor( 0, .25, 0 )
	sceneGroup:insert( fractionText )

	function addNewGear()
	    local startX = math.random(display.contentWidth*0.1,display.contentWidth*0.9)
	    if(math.random(1,5)==1) then
	        -- 100
	        Torx = display.newImage( "leverImages/100.png", startX, -100)
	        sceneGroup:insert( Torx )
	        Torx:toBack()
	        BG:toBack( )
	        physics.addBody( Torx )
	        Torx.linearDamping = 5
	        Torx.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Torx )
	        Torx:addEventListener( "touch", addHund)
	        Torx:addEventListener( "touch", correctGearTouched )
	        
	    end
	    if(math.random(1,5)==2) then
	        -- 20
	        Spline = display.newImage( "leverImages/20.png", startX, -100)
	        sceneGroup:insert( Spline )
	        Spline:toBack()
	        BG:toBack()
	        physics.addBody( Spline )
	        Spline.linearDamping = 5
	        Spline.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Spline )
	        Spline:addEventListener( "touch", addTwen)
	        Spline:addEventListener( "touch", correctGearTouched )
	        
	    end
	    if(math.random(1,5)==3) then
	        -- 5
	        Hex = display.newImage( "leverImages/5.png", startX, -100)
	        sceneGroup:insert( Hex )
	        Hex:toBack()
	        BG:toBack()
	        physics.addBody( Hex )
	        Hex.linearDamping = 5
	        Hex.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Hex )
	        Hex:addEventListener( "touch", addFive)
	        Hex:addEventListener( "touch", correctGearTouched )
	        
	    end
	    if(math.random(1,5)==4) then
	        -- 50
	        Allen = display.newImage( "leverImages/50.png", startX, -100)
	        sceneGroup:insert( Allen )
	        Allen:toBack()
	        BG:toBack()
	        physics.addBody( Allen )
	        Allen.linearDamping = 5
	        Allen.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Allen  )
	        Allen:addEventListener( "touch", addFif)
	        Allen:addEventListener( "touch", correctGearTouched )
	        
	    end
	    if(math.random(1,5)==5) then
	        -- 10
	        Phillips = display.newImage( "leverImages/10.png", startX, -100)
	        sceneGroup:insert( Phillips )
	        Phillips:toBack()
	        BG:toBack()
	        physics.addBody( Phillips )
	        Phillips.linearDamping = 5
	        Phillips.enterFrame = offscreen
	        Runtime:addEventListener( "enterFrame", Phillips )
	        Phillips:addEventListener( "touch", addTen)
	        Phillips:addEventListener( "touch", correctGearTouched )
		end
	end
end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "did" ) then

		function correctGearTouched(event)
			if ( event.phase == "began" ) then
				Runtime:removeEventListener( "enterFrame", event.self )
				event.target:removeSelf()
				if(RightWieght < avalableFracs2[randomFrac]) then
					fractionText.text = "Left Weight: " .. avalableFracs[randomFrac] .. " Right Weight: " .. RightWieght

				elseif(RightWieght == avalableFracs2[randomFrac]) then
					hearts = hearts + 1
					scoreText.text = hearts
					randomFrac =  math.random( #avalableFracs )
					RightWieght = 0
					fractionText.text = "Left Weight: " .. avalableFracs[randomFrac] .. " Right Weight: " .. RightWieght
				

				elseif(RightWieght > avalableFracs2[randomFrac]) then
					hearts = hearts - 1
					scoreText.text = hearts
					randomFrac =  math.random( #avalableFracs )
					RightWieght = 0
					fractionText.text = "Left Weight: " .. avalableFracs[randomFrac] .. " Right Weight: " .. RightWieght
				end		
			end
		end
		
		function addHund(event)
			if ( event.phase == "began" ) then
				RightWieght = 100 + RightWieght
			end
		end

		function addTwen(event)
			if ( event.phase == "began" ) then
				RightWieght = 20 + RightWieght
			end
		end

		function addFive(event)
			if ( event.phase == "began" ) then
				RightWieght = 5 + RightWieght
			end
		end

		function addFif(event)
			if ( event.phase == "began" ) then
				RightWieght = 50 + RightWieght
			end
		end

		function addTen(event)
			if ( event.phase == "began" ) then
				RightWieght = 10 + RightWieght
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
    	display.remove( Hex )
    	display.remove( Allen )
    	display.remove( Phillips )
    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )
scene:addEventListener( "hide", scene )

return scene