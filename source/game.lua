import 'apple'
import 'snake'
import 'dot'

direction = "DOWN"
gameState = "PLAY"

apple = Apple:new()
snake = Snake:new(0, 0)
gfx = playdate.graphics