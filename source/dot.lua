import 'game'

Dot = { x = 0, y = 0, previousX = 0, previousY = 0, dotSize = 10 }

local gfx = playdate.graphics

function Dot:new (x, y, dotSize)
	local o = {}
	setmetatable(o, self)
	self.__index = self
	self.x = x
	self.y = y
	self.dotSize = dotSize
	return o
end

-- Set x and save previousX to draw snake
function Dot:setX(x)
	self.previousX = self.x
	self.x = x
end

-- Set y and save previousY to draw snake
function Dot:setY(y)
	self.previousY = self.y
	self.y = y
end

function Dot:draw()
	gfx.fillRect(self.x, self.y, self.dotSize, self.dotSize)
end