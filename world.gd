extends Node2D
var PlayerScene = load("res://player_base.tscn")
var Player = Node2D 

func _process(delta: float) -> void:
	pass
	
func _ready() -> void:
	player_instance()

func player_instance():
	Player = PlayerScene.instantiate()
	$Spawn.add_child(Player)
