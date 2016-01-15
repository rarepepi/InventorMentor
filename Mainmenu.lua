local composer = require( "composer" )
local scene = composer.newScene()
------------------------------------------------------------------------------------------
display.setStatusBar(display.HiddenStatusBar);
centerX = display.contentCenterX
centerY = display.contentCenterY

actualW = display.actualContentWidth
actualH = display.actualContentHeight
--[[
actualWD2 = display.actualContentWidth/2
actualHD2 = display.actualContentHeight/2

function scene:create( event )

    local sceneGroup = self.view
    local BG = display.newImage("background.png", centerX, centerY)
    sceneGroup:insert( BG )

end

function scene:show( event )

    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "did" ) then

    local robotHead = display.newImage("robot.png",150, 110)
    sceneGroup:insert( robotHead )

    local titleTxt = display.newText( "Inventor Mentor", 160, 60, native.systemFontBold, 40 )
    titleTxt:setTextColor( 1, 1, 0 )
    sceneGroup:insert( titleTxt )

    local gameTxt = display.newText ("Play", 160 , 160, native.systemFontBold, 30)
    gameTxt:setTextColor( 1, 1, 0 )
    sceneGroup:insert( gameTxt )



    local fineTxt = display.newText ("*This game is still in developement", 160 , 480, native.systemFontBold, 10)
    creditsTxt:setTextColor( 1, 1, 0 )
    sceneGroup:insert( fineTxt )



    local function gotoGames(event)
        if event.phase == "ended" then 
            composer.gotoScene( "Gamemenu", { time = 500, effect = "fromBottom" })
        end
    end



    gameTxt:addEventListener( "touch", gotoGames )
    helpTxt:addEventListener( "touch", gotoHelp )
    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene
]]