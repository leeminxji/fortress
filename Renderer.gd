class_name Renderer
extends Node

# Game
var game: Game

# Node
var ballArea2D
var ballCollisionShape2D
var ballPolygon2D

# Constant
const radius: int = 10
const color = Color(1.0, 0.0, 0.0)


func _init(_game: Game):
	game = _game


func _enter_tree():
	AttachNodes(game)


func _ready():
	pass


func _physics_process(_fdt):
	pass


func _process(_dt):
	UpdateNodes()


func _exit_tree():
	ballArea2D.queue_free()


func AttachNodes(game):
	# ball
	ballArea2D = Area2D.new()
	ballArea2D.name = "ballArea2D"
	ballCollisionShape2D = CollisionShape2D.new()
	ballCollisionShape2D.name = "ballCollisionShape2D"
	ballArea2D.add_child(ballCollisionShape2D)
	ballPolygon2D = Polygon2D.new()
	ballPolygon2D.name = "ballPolygon2D"
	ballPolygon2D.polygon = GetCirclePoly(radius, color)
	ballArea2D.add_child(ballPolygon2D)
	ballArea2D.position = ConvertVector(game.ball.position)
	add_child(ballArea2D)


func UpdateNodes():
	# ball
	ballArea2D.position = ConvertVector(game.ball.position)


func ConvertVector(vector: Vector2) -> Vector2:
	var height = ProjectSettings.get("display/window/size/viewport_height")
	var vector2 = Vector2()
	vector2.x = vector.x
	vector2.y = height-vector.y
	return vector2


# https://docs.godotengine.org/en/stable/tutorials/2d/custom_drawing_in_2d.html#arc-polygon-function
func GetCirclePoly(radius, color):
	var center = Vector2()
	var nb_points = 32
	var points_arc = PackedVector2Array()
	points_arc.push_back(center)
	var colors = PackedColorArray([color])

	for i in range(nb_points + 1):
		var angle_point = deg_to_rad(i * 360 / nb_points - 90)
		points_arc.push_back(center + Vector2(cos(angle_point), sin(angle_point)) * radius)
	return points_arc
