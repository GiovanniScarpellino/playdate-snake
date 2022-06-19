import 'game'

Snake = { x = 0, y = 0, dots = {}, dotLength = 0 }

local screenWidth = playdate.display.getWidth()
local screenHeight = playdate.display.getHeight()

function Snake:new (x, y)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	self.x = x
	self.y = y
	self.dotSize = 10
	self.addDot(self)
	return o
end

function Snake:checkApple(apple)
	if apple.x == self.x and apple.y == self.y then
		apple = Apple:new()
		self.addDot(self)
	end
end

function Snake:draw()
	for i = 0, self.dotLength - 1 do
		if i == 0 then
			self.dots[i]:setX(self.x)
			self.dots[i]:setY(self.y)
		else
			self.dots[i]:setX(self.dots[i - 1].previousX)
			self.dots[i]:setY(self.dots[i - 1].previousY)

			if self.dots[0].x == self.dots[i].x and self.dots[0].y == self.dots[i].y then
				gameState = "DEAD"
			end
		end

		self.dots[i]:draw()
	end
end

function Snake:addDot()
	if self.dotLength == 0 then
		self.dots[self.dotLength] = Dot:new(0, 0, self.dotSize)
	else
		local previousDot = self.dots[self.dotLength - 1]
		self.dots[self.dotLength] = Dot:new(previousDot.x + self.dotSize, previousDot.y + self.dotSize, self.dotSize)
	end
	self.dotLength = self.dotLength + 1
end

function Snake:move()
	if direction == "DOWN" then
		self.down(self)
	elseif direction == "UP" then
		self.up(self)
	elseif direction == "LEFT" then
		self.left(self)
	elseif direction == "RIGHT" then
		self.right(self)
	end

	self:draw()
end

function Snake:down ()
	if self.y + 1 >= (screenHeight - self.dotSize) then
		self.y = 0
	else
		self.y = self.y + self.dotSize
	end
end

function Snake:up ()
	if self.y - 1 <= 0 then
		self.y = screenHeight - self.dotSize
	else
		self.y = self.y - self.dotSize
	end
end

function Snake:left ()
	if self.x - 1 <= 0 then
		self.x = screenWidth - self.dotSize
	else
		self.x = self.x - self.dotSize
	end
end

function Snake:right ()
	if self.x + 1 >= (screenWidth - self.dotSize) then
		self.x = 0
	else
		self.x = self.x + self.dotSize
	end
end