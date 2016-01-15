local composer = require( "composer" )
local scene = composer.newScene()
------------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar);


centerX = display.contentCenterX
centerY = display.contentCenterY

function scene:create( event )

    local sceneGroup = self.view
    local BG = display.newImage("background.png", centerX, centerY)
    sceneGroup:insert( BG )

    lever = display.newImage("planeImages/triangle77.png", 160, 50)
    sceneGroup:insert( lever )
    leverText = display.newText("Plane Help", 160 , -20, native.systemFontBold, 20)
    leverText:setTextColor( 1, 1, 0 )
    sceneGroup:insert( leverText )

    tipText = display.newText("Tip:", 300 , 230, display.contentWidth, display.contentHeight * 0.5, native.systemFontBold, 20)
    tipText:setTextColor( 1, 1, 0 )
    sceneGroup:insert( tipText )

    tipTextinfo = display.newText("The size of a robot is restricted in most competitions so it is important to be able to calculate area.", 165 , 260, display.contentWidth, display.contentHeight * 0.5, native.systemFont, 15)
    tipTextinfo:setTextColor( 1, 1, 0 )
    sceneGroup:insert( tipTextinfo )

    objText = display.newText("Objective:", 260 , 320, display.contentWidth, display.contentHeight * 0.5, native.systemFontBold, 20)
    objText:setTextColor( 1, 1, 0 )
    sceneGroup:insert( objText )

    objTextinfo = display.newText("The object of the game is to select the triangle with the corresponding angle at the top of the screen.", 165 , 350, display.contentWidth, display.contentHeight * 0.5, native.systemFont, 15)
    objTextinfo:setTextColor( 1, 1, 0 ) 
    sceneGroup:insert( objTextinfo )

    howText = display.newText("How to Play: ", 250 , 400, display.contentWidth, display.contentHeight * 0.5, native.systemFontBold, 20)
    howText:setTextColor( 1, 1, 0 )
    sceneGroup:insert( howText )

    howTextinfo = display.newText("Click on the plane falling down the screen. In order to receive a reward. You must match the plane with the angle above.", 165 , 425, display.contentWidth, display.contentHeight * 0.5, native.systemFont, 15)
    howTextinfo:setTextColor( 1, 1, 0 )
    sceneGroup:insert( howTextinfo )

    playText = display.newText("Play", 60 , 470, native.systemFontBold, 30)
    playText:setTextColor( 1, 1, 0 )
    sceneGroup:insert( playText )

    playText2 = display.newText("Now", 60 , 500, native.systemFontBold, 30)
    playText2:setTextColor( 1, 1, 0 )
    sceneGroup:insert(playText2)

    moreinfoText = display.newText("More", 260 , 470, native.systemFontBold, 30)
    moreinfoText:setTextColor( 1, 1, 0 )
    sceneGroup:insert( moreinfoText )

    moreinfoText2 = display.newText("Info", 260 , 500, native.systemFontBold, 30)
    moreinfoText2:setTextColor( 1, 1, 0 )
    sceneGroup:insert( moreinfoText2 )

end

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "did" ) then

       function gotoGamemenu(event)
        if event.phase == "ended" then 
            composer.gotoScene( "help", { time = 500, effect = "zoomInOutFade" })
        end
    end

       function gotoGear(event)
        if event.phase == "ended" then 
            composer.gotoScene( "planeGame", { time = 500, effect = "zoomInOutFade" })
        end
    end

playText:addEventListener( "touch", gotoGear )
playText2:addEventListener( "touch", gotoGear )
moreinfoText:addEventListener( "touch", gotoGamemenu )
moreinfoText2:addEventListener( "touch", gotoGamemenu )


    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene