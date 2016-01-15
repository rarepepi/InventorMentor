local composer = require( "composer" )
local scene = composer.newScene()
------------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar);


centerX = display.contentCenterX
centerY = display.contentCenterY

function scene:create( event )

    local sceneGroup = self.view
    local BG = display.newImage("leverImages/leverBackground.jpg", centerX, centerY)
    sceneGroup:insert( BG )

    local menuButton = display.newText ("Back", 250 , 500, native.systemFontBold, 20)
    menuButton:setTextColor( 0, .25, 0 )
    sceneGroup:insert( menuButton )

    local function gotoMainmenu(event)
            if event.phase == "ended" then 
                composer.gotoScene( "Gamemenu", { time = 500, effect = "fromRight" })
            end
        end

    menuButton:addEventListener( "touch", gotoMainmenu )
    aboutText = display.newText ("About", 50 , 500, native.systemFontBold, 20)
    aboutText:setTextColor( 0, .25, 0 )
    sceneGroup:insert( aboutText )

    robotHead = display.newImage("robot.png",150, 100)
    sceneGroup:insert( robotHead )

    titleTxt = display.newText( "Help Page", 160, 30, native.systemFontBold, 30)
    titleTxt:setTextColor( 0, .25, 0 )
    sceneGroup:insert( titleTxt )

    gearGameImg = display.newImage( "gearImages/gear2_4.png", 100, 100)
    sceneGroup:insert( gearGameImg )

    geargameTxt = display.newText ( "Gear's", 100, 160, native.systemFontBold, 15)
    geargameTxt:setTextColor( 0, .25, 0 )
    sceneGroup:insert( geargameTxt )

    leverGameImg = display.newImage( "leverImages/50.png", 230, 95)
    sceneGroup:insert( leverGameImg )

    leverGameTxt = display.newText ( "Lever's", 230, 160, native.systemFontBold, 15)
    leverGameTxt:setTextColor( 0, .25, 0 )
    sceneGroup:insert( leverGameTxt )

    pullyGameImg = display.newImage( "pulleyImages/49π.png", 100, 250)
    sceneGroup:insert( pullyGameImg )

    pulleyGameTxt = display.newText( "Pulley's", 100, 310, native.systemFontBold, 15)
    pulleyGameTxt:setTextColor( 0, .25, 0 )
    sceneGroup:insert( pulleyGameTxt )

    planeGameImg = display.newImage( "planeImages/triangle100.png", 230, 255)
    sceneGroup:insert( planeGameImg )

    planeGameTxt = display.newText( "Planes", 230, 310, native.systemFontBold, 15)
    planeGameTxt:setTextColor( 0, .25, 0 )
    sceneGroup:insert( planeGameTxt )

    screwGameImg = display.newImage( "screwImages/allen.png", 100, 390)
    sceneGroup:insert( screwGameImg )

    screwGameTxt = display.newText( "Screws", 100, 450, native.systemFontBold, 15)
    screwGameTxt:setTextColor( 0, .25, 0 )
    sceneGroup:insert( screwGameTxt )

    wedgeGameImg = display.newImage( "wedgeImages/wedge102.png", 230, 390)
    sceneGroup:insert( wedgeGameImg )

    wedgeGameTxt = display.newText( "Wedges", 230, 450, native.systemFontBold, 15)
    wedgeGameTxt:setTextColor( 0, .25, 0 )
    sceneGroup:insert( wedgeGameTxt )

end

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "did" ) then

        function gotoGearGame(event)
            if event.phase == "began" then 
                composer.gotoScene( "gearHelp", { time = 500, effect = "zoomInOutFade" })
            end
        end

        function gotoLeverGame(event)
        	if event.phase == "began" then 
        		composer.gotoScene( "helpLever", { time = 500, effect = "zoomInOutFade" })
        	end
        end

        function gotoPullyGame(event)
            if event.phase == "began" then 
                composer.gotoScene( "helpPulley", { time = 500, effect = "zoomInOutFade" })
            end
        end

        function gotoPlaneGame(event)
            if event.phase == "began" then 
                composer.gotoScene( "helpPlane", { time = 500, effect = "zoomInOutFade" })
            end
        end

        function gotoScrewGame(event)
            if event.phase == "began" then 
                composer.gotoScene( "helpScrew", { time = 500, effect = "zoomInOutFade" })
            end
        end

        function gotoWedgeGame(event)
            if event.phase == "began" then 
                composer.gotoScene( "helpWedge", { time = 500, effect = "zoomInOutFade" })
            end
        end

        function gotoCredits(event)
            if event.phase == "began" then 
                composer.gotoScene( "credits", { time = 500, effect = "fromLeft" })
            end
        end

    aboutText:addEventListener( "touch", gotoCredits )
    gearGameImg:addEventListener( "touch", gotoGearGame )
    leverGameImg:addEventListener( "touch", gotoLeverGame )
    pullyGameImg:addEventListener( "touch", gotoPullyGame )
    planeGameImg:addEventListener( "touch", gotoPlaneGame )
    screwGameImg:addEventListener( "touch", gotoScrewGame )
    wedgeGameImg:addEventListener( "touch", gotoWedgeGame )

    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene