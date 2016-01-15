local composer = require( "composer" )
local scene = composer.newScene()

function scene:create( event )
    local sceneGroup = self.view

    local BG = display.newImage("background.png", centerX, centerY)
    sceneGroup:insert( BG )


	local appDesc = display.newText( "This Application was built for new robotics members. In this application users will have to use math skills that are used throughout the robot building process. This way they can get a head start for the upcoming Robotics Season. Users practice elements of robotics that we the developers toke straight from the textbook and implement the text into a fun interactive game for learning.", 170, 90, display.contentWidth-20, display.contentHeight * 0.5, native.systemFontBold, 15 )
	appDesc:setFillColor( 1, 1, 0 )
	sceneGroup:insert( appDesc )


	developersTxt = display.newText( "Developers:" , 160, 200, native.systemFontBold, 20)
	developersTxt:setFillColor( 1, 1, 0 )
	sceneGroup:insert( developersTxt )


	creditTxt3 = display.newText( "Jose Martinez" , 160, 230, native.systemFontBold, 20)
	creditTxt3:setFillColor( 1, 1, 0 )
	sceneGroup:insert( creditTxt3 )


	creditTxt4 = display.newText( "Michael Semren" , 160, 260, native.systemFontBold, 20)
	creditTxt4:setFillColor( 1, 1, 0 )
	sceneGroup:insert( creditTxt4 )


	creditTxt5 = display.newText( "Atanas Bogdanoski" , 160, 290, native.systemFontBold, 20)
	creditTxt5:setFillColor( 1, 1, 0 )
	sceneGroup:insert( creditTxt5 )

	local creditTxt6 = display.newText( "Special Thanks to our advisor Mrs. Fuhrmann and to openclipart.org for providing the royalty free that were images used in the game.", 170, 550, display.contentWidth-30, display.contentHeight * 0.5, native.systemFontBold, 12 )
	creditTxt6:setFillColor( 1, 1, 0 )
	sceneGroup:insert( creditTxt6 )

	local menuButton = display.newText ("Back", 250 , 500, native.systemFontBold, 20)
	menuButton:setTextColor( 1, 1, 0 )
	sceneGroup:insert( menuButton )

	local function gotoMainmenu(event)
	    	if event.phase == "ended" then 
	    		composer.gotoScene( "Gamemenu", { time = 500, effect = "fromRight" })
	    	end
	    end

	menuButton:addEventListener( "touch", gotoMainmenu )
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene	