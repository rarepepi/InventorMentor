local composer = require( "composer" )
local scene = composer.newScene()
------------------------------------------------------------------------------------------
system.setIdleTimer( false )
------------------------------------------------------------------------------------------
local widget = require( "widget" )
------------------------------------------------------------------------------------------

centerX = display.contentCenterX
centerY = display.contentCenterY

actualW = display.actualContentWidth
actualH = display.actualContentHeight

actualWD2 = display.actualContentWidth/2
actualHD2 = display.actualContentHeight/2

function scene:create( event )
    local sceneGroup = self.view

    local BG = display.newRect( centerX, centerY, actualW, actualH )
    BG:setFillColor( 0, 0, 1 )
    sceneGroup:insert( BG )

end

function scene:show( event )
    local sceneGroup = self.view
    local phase = event.phase

    if ( phase == "did" ) then

--------------------------------------------------------------------------------
--------------------------------------------------------------------------------
    local highScore

    _path = system.pathForFile( "highScore.txt", system.DocumentsDirectory )
    _file = io.open( _path, "r" )

    for line in _file:lines() do
       highScore = tonumber (line)
    end

    io.close( _file )
    _file = nil
    _path = nil
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------    
    local playerScore

    _path = system.pathForFile( "playerScore.txt", system.DocumentsDirectory )
    _file = io.open( _path, "r" )

    for line in _file:lines() do
       playerScore = tonumber (line)
    end

    io.close( _file )
    _file = nil
    _path = nil
--------------------------------------------------------------------------------
--------------------------------------------------------------------------------  

    local scoreText = display.newText( "Score: "..playerScore, centerX - 50, centerY - 200, native.systemFontBold, 30 )
    sceneGroup:insert( scoreText )

    local highScoreText = display.newText( "highScore: "..highScore, centerX - 50, centerY - 100, native.systemFontBold, 30 )
    sceneGroup:insert( highScoreText )

    local restartBtn = display.newText( "Restart", centerX, centerY, native.systemFontBold, 40 )
    sceneGroup:insert( restartBtn )

    local function gotoGame(event)
        if event.phase == "ended" then 
            display.remove( scoreText )
            display.remove( highScoreText )
            composer.gotoScene( "game", { time = 1000, effect = "crossFade" })
            print("hi")
        end
        return true
    end

    restartBtn:addEventListener( "touch", gotoGame )

    end
end

scene:addEventListener( "create", scene )
scene:addEventListener( "show", scene )

return scene