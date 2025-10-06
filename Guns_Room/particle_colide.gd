extends GPUParticles2D

func _on_start_state_entered() -> void:
	$Blood.send_event("Finish")



func _on_finish_state_entered() -> void:
	$".".queue_free()
