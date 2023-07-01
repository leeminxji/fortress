extends Node

var INIT_DEG = 0.0
var degree = INIT_DEG
var scale = 10.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	if Input.is_action_pressed("aim"):
		degree -= scale * delta
	if Input.is_action_just_released("aim"):
		degree = INIT_DEG
	$Body/Pivot.rotation_degrees = degree

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
