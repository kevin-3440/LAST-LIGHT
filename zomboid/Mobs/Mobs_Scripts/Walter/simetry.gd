extends Node2D
#Variable Inactiva
var velocity = Vector2(0,0)
#Curs
var Cursor = Node2D
# Pivote del Brazo
var Pivot = Node2D
#Rotacion de el Node del Curs
var Rotation = Node2D
#Eventos Creados por mí 
var W = InputEventAction
var S = InputEventAction
var A = InputEventAction
var D = InputEventAction
#Sensibilidad del Cursor
var Sens = 10
#Limite de mi Circulo
var Radio = 70
#Centro de mi Circulo
var Center = Vector2(0,0)


func _ready() -> void:
	Cursor = %Curs
	Pivot = %Pivot
	Rotation = $"."
	Center = %Brazo.global_position



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
	
	if Cursor.position.x or Cursor.position.y > Radio:
		Cursor.global_position = Center
	
	
	
	
	var Cursor_Move_y = Input.get_axis("ui_W","ui_S")
	if Cursor_Move_y:
		Cursor.position.y += Cursor_Move_y * Sens

	var Cursor_Move_x = Input.get_axis("ui_A","ui_D")
	if Cursor_Move_x:
		Cursor.position.x += Cursor_Move_x * Sens
