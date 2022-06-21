import 'game'

-- Used for screen refresh and snake speed
playdate.display.setRefreshRate(5)

function playdate.update()
	if gameState == "PLAY" then
		-- Clean screen on each tick
		gfx.clear()
		-- Draw the apple
		apple:draw()
		-- Check if snake eat the apple
		snake:checkApple(apple)
		-- Move the snake
		snake:move()
		-- Move snake
		snake:draw()
	elseif gameState == "DEAD" then
		-- Add game over text
		gfx.drawText("*GAME OVER*", 157, 220)
	end
end

-- Playdate buttons

function playdate.downButtonDown()
	if direction ~= "UP" then
		direction = "DOWN"
	end
end

function playdate.upButtonDown()
	if direction ~= "DOWN" then
		direction = "UP"
	end
end

function playdate.leftButtonDown()
	if direction ~= "RIGHT" then
		direction = "LEFT"
	end
end

function playdate.rightButtonDown()
	if direction ~= "LEFT" then
		direction = "RIGHT"
	end
end