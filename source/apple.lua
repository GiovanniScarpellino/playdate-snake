Apple = { x = 0, y = 0, dotSize = 10 }

local gfx = playdate.graphics
local screenWidth = playdate.display.getWidth()
local screenHeight = playdate.display.getHeight()

function Apple:new ()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	-- Set random position of apple
	self.x = math.floor(math.random(self.dotSize, screenWidth - self.dotSize))
	self.x = self.x - (self.x % self.dotSize)
	self.y = math.floor(math.random(self.dotSize, screenHeight - self.dotSize))
	self.y = self.y - (self.y % self.dotSize)
	self.dotSize = self.dotSize
	return o
end

function Apple:draw ()
	gfx.drawRect(self.x, self.y, self.dotSize, self.dotSize)
end