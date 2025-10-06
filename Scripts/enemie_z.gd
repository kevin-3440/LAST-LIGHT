extends Node2D
@onready var Zombie_Anim = %Zombie
var Vision_Area = Area2D
@onready var Blood_Marker = %Blood

func _ready() -> void:
	Zombie_Anim.play("Idle")
	Vision_Area = %Vision.area_entered
func _process(_delta: float) -> void:
	print("Enter",Vision_Area)
func _Blood():
	var Blood = preload("res://Guns_Room/particle_colide.tscn")
	var Blood_on = Blood.instantiate()
	Blood_on.position = BULL_DIRECTION.Blood_position
	Blood_Marker.get_parent().add_child(Blood_on)


func _on_bullet_colision_area_entered(_area: Area2D) -> void:
	if _area.is_in_group("Bullet"):
		_Blood()






func _on_vision_area_entered(area: Area2D) -> void:
	pass
