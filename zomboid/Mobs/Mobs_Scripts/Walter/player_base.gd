extends Node2D
func _process(delta: float) -> void:
	$CharacterBody2D/Skeleton2D/Corpse.play("Hands")
