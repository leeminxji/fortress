extends Node

var game
var renderer


func _init():
	game = Game.new()
	renderer = Renderer.new(game)
	renderer.name = "Renderer"
	add_child(renderer)


func _enter_tree():
	game.Enter()


func _ready():
	game.Ready()


func _physics_process(fdt):
	game.Step(fdt)
#	if game.isEnd: get_tree().quit()
	if game.isEnd:
		queue_free()
		get_tree().quit()


func _process(dt):
	game.Update(dt)
#	if game.isEnd: get_tree().quit()
	if game.isEnd:
		queue_free()
		get_tree().quit()


func _exit_tree():
	pass
