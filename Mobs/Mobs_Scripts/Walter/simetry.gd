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
var Sens = 100
#Limite de mi Circulo
var Radio = 100.0
#Centro de mi Circulo
var Center = Vector2(0,0)



func _ready() -> void:
	Cursor = %Curs
	Pivot = %Pivot
	Rotation = $"."





	W = "ui_W"
	S = "ui_S"
	A = "ui_A"
	D = "ui_D"

func _process(_delta: float) -> void:
	#Cursor.global_position = Pivot.global_position## + Locate
	Cursor.rotation = Pivot.rotation
	CurMove()
func CurMove():
	$".".position = $"../Walter".position
	var Distance = Center.distance_to(Cursor.position)
	if Distance > Radio:
	# Si la distancia es mayor que el radio, ajusta la posición
	# Normaliza la dirección para obtener un vector unitario
		var direction = (Cursor.position - Center).normalized()
	# Mueve el cursor a la posición en el borde del círculo
		Cursor.position = Center + direction * Radio

	var Cursor_Move_y = Input.get_axis("ui_up","ui_down")
	var Cursor_Move_x = Input.get_axis("ui_left","ui_right")

	var Raw_Direction = Vector2(Cursor_Move_x,Cursor_Move_y).normalized()
	if Raw_Direction:
		Cursor.position = Raw_Direction * Sens
	#if Raw_Direction:
		#Cursor.position.y += Cursor_Move_y * Sens
