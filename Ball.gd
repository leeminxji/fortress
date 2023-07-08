class_name Ball

# Constant
const GRAVITY = Vector2(0, -9.8)
const RADIUS = 10
const COLOR = Color(1.0, 0.0, 0.0)

# Variables
var position = Vector2(0.0, 0.0)
var velocity = Vector2(50, 50)

var SetEnd: Callable


func _init(_SetEnd: Callable):
	SetEnd = _SetEnd


func Throw(dt: float):
	position += velocity * dt
	velocity += GRAVITY * dt

	if position.y < 0:
		SetEnd.call(true)
