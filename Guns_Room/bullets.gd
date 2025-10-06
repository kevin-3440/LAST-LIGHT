extends Node2D
@onready var Gun = Node2D
var Pistol = Sprite2D
@onready var Brazo = %Brazo
var Bull_emision = true
@onready var Bala = %Bullet
@onready var Puntero = %Puntero
@onready var Pivot = %Pivot
var Emitt = Vector2(20,20)
@onready var Fire_Mot = %Fire_Shoot

func _ready() -> void:
	Gun = $".."
	Pistol = %M4Remastered



func _process(_delta: float) -> void:
	if Brazo.flip_h == true:
		Pistol.flip_v = true
		BULL_DIRECTION.Bull_Direction = true
		position.y = 35
		#Bullets.position.y = 10.5
	else: 
		Pistol.flip_v = false
		position.y = -35
		BULL_DIRECTION.Bull_Direction = false
		#Bullets.position.y = -1-1-1




func _on_fire_state_processing(_delta: float) -> void:
	%Estate.send_event("Repose")

	const Bullet = preload("res://Guns_Room/bullet.tscn")
	var Shoot = Bullet.instantiate()
		
	if Input.is_action_pressed("ui_A"):
		Puntero.add_child(Shoot)

		Fire_Mot.emitting = true
		Shoot.position = Bala.global_position
		if BULL_DIRECTION.Bull_Direction == true:
			Shoot.rotation = 0.02 + Pivot.rotation + RNG.random(-0.1,0.1)
		else:
			Shoot.rotation = 0.02 + Pivot.rotation + RNG.random(-0.1,0.1)








func _on_repose_state_processing(_delta: float) -> void:
	if Input.is_action_pressed("ui_A"):
		%Estate.send_event("Fire")
	if not Input.is_action_pressed("ui_A"):
		Fire_Mot.emitting = false
