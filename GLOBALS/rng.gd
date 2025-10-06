extends Node
@onready var rng : RandomNumberGenerator = RandomNumberGenerator.new()


func random(min_number,max_number):
	rng.randomize()
	return rng.randf_range(min_number,max_number)
