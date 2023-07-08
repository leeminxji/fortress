class_name Renderer
extends Node

# System
var HEIGHT = ProjectSettings.get("display/window/size/viewport_height")

# Game
var game: Game

# Node
## Ball
var ballArea2D # root
var ballCollisionShape2D
var ballPolygon2D
## Cannon
var cannonLine2D


func _init(_game: Game):
	game = _game


func _enter_tree():
	AttachNodes()


func _ready():
	pass


func _physics_process(_fdt):
	pass


func _process(_dt):
	UpdateNodes()


func _exit_tree():
	ballArea2D.queue_free()
	cannonLine2D.queue_free()


func AttachNodes():
	AttachBall()
	AttachCannon()


func AttachBall():
	ballArea2D = Area2D.new()
	ballArea2D.name = "ballArea2D"
	ballCollisionShape2D = CollisionShape2D.new()
	ballCollisionShape2D.name = "ballCollisionShape2D"
	ballArea2D.add_child(ballCollisionShape2D)
	ballPolygon2D = Polygon2D.new()
	ballPolygon2D.name = "ballPolygon2D"
	ballPolygon2D.polygon = GetCirclePoly(game.ball.RADIUS)
	ballPolygon2D.color = game.ball.COLOR
	ballArea2D.add_child(ballPolygon2D)
	ballArea2D.position = ConvertVector(game.ball.position)
	add_child(ballArea2D)


func AttachCannon():
	cannonLine2D = Line2D.new()
	cannonLine2D.name = "cannonLine2D"
	cannonLine2D.add_point(ConvertVector(game.cannon.pointA))
	cannonLine2D.add_point(ConvertVector(game.cannon.pointB))
	add_child(cannonLine2D)


func UpdateNodes():
	# Ball
	ballArea2D.position = ConvertVector(game.ball.position)
	# Cannon
	cannonLine2D.set_point_position(1, ConvertVector(game.cannon.pointB))
	


func ConvertVector(vector: Vector2) -> Vector2:
	var vector2 = Vector2()
	vector2.x = vector.x
	vector2.y = HEIGHT - vector.y
	return vector2


# https://docs.godotengine.org/en/stable/tutorials/2d/custom_drawing_in_2d.html#arc-polygon-function
func GetCirclePoly(radius):
	var center = Vector2()
	var nb_points = 32
	var points_arc = PackedVector2Array()
	points_arc.push_back(center)

	for i in range(nb_points + 1):
		var angle_point = deg_to_rad(i * 360 / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	return points_arc
