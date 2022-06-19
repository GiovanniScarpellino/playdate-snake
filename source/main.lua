import 'game'

playdate.display.setRefreshRate(5)

function playdate.update()
	if gameState == "PLAY" then
		gfx.clear()
		apple:draw()
		snake:checkApple(apple)
		snake:move()
	elseif gameState == "DEAD" then
		gfx.drawText("*GAME OVER*", 157, 220)
	end
end

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