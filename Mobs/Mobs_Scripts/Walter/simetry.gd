extends Node2D

var velocity = Vector2(0,0)
var Cursor = Node2D
var Pivot = Node2D
var Rotation = Node2D
var W = InputEventAction
var S = InputEventAction
var A = InputEventAction
var D = InputEventAction
var SpR = 100
var Cursor_G = Node2D

func _ready() -> void:
	Cursor = %Curs
	Cursor_G = %Curs.position
	Pivot = %Pivot
	Rotation = $"."

	W = "ui_W"
	S = "ui_S"
	A = "ui_A"
	D = "ui_D"

func _process(_delta: float) -> void:
	print("Position:",$".".position)
	print("PivotP:",%Pivot.rotation)
	#Cursor.global_position = Pivot.global_position## + Locate
	Cursor.rotation = Pivot.rotation
	CurMove()
func CurMove():
	var Cursor_Move = Input.get_axis("ui_W","ui_S")
	if Cursor_Move:
		Cursor_G.x = Cursor_Move * SpR
	
#	Rotation.rotation = Cursor_G
