extends MeshInstance2D
@onready var Bull = $"../.."
@onready var Bullet = %Bullet_g
@export var Speed = 5
var Estado = StateChart
func _ready() -> void:
	Estado = %Estado

func _process(_delta: float) -> void:
	Bull.position.x += Speed


#Tiempo para su Destrucción
func _on_start_state_entered() -> void:
	Estado.send_event("Destroy")
	
#Destruccion de la Bala
func _on_destroy_state_entered() -> void:
	Bull.queue_free()


func _on_colision_area_entered(_area: Area2D) -> void:
	if _area.is_in_group("Bullet_Colision_Livings"):
		BULL_DIRECTION.Blood_position = Bull.global_position
		print(BULL_DIRECTION.Blood_position)
		Bull.queue_free()
