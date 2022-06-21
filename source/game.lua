import 'apple'
import 'snake'
import 'dot'

-- DOWN, UP, LEFT, RIGHT
direction = "DOWN"
-- PLAY, DEAD
gameState = "PLAY"

apple = Apple:new()
snake = Snake:new(0, 0)
gfx = playdate.graphics