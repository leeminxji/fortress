class_name Game

var stepCnt: int = 0
var updateCnt: int = 0
var isEnd: bool = false

var ball: Ball
var cannon: Cannon

func SetEnd(flag: bool):
	isEnd = flag


func Ready():
	pass


func Enter():
	ball = Ball.new(SetEnd)
	cannon = Cannon.new()


func Exit():
	pass


func UpdateInput():
	pass


func Step(fdt: float):
	stepCnt += 1
	ball.Throw(fdt)
	cannon.Aim(fdt)
	#
	Log()


func Update(dt: float):
	updateCnt += 1


func Log(): # DEBUG
	if stepCnt % 100 == 0:
		print("[Game.Step] stepCnt: ", stepCnt, " updateCnt: ", updateCnt)
		print("[Game.Step] ", ball.position)
