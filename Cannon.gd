class_name Cannon

# Constant
const dTheta = PI / 180.0

const pointA = Vector2(10, 10)
# Variable
var pointB = Vector2(110, 10)
var theta = 0


func Aim(dt: float):
	theta += dTheta * dt
	pointB = pointB.rotated(theta)
