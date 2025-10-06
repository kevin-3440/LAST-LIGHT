extends CharacterBody2D
##Mis Variables
var anim = AnimationPlayer
@export var Gravity = 50
@export var Speed = 200
var repose = velocity * 0
var point = Vector2()
var Cursor = Sprite2D
var anima = StateChart
#Skins
var Gas_Mask = Sprite2D
func _ready() -> void:
	anim = %Corpse
	velocity.normalized()
	%Brazo.position.x = 0
	Cursor = %Curs
	anima = %Estados_Base
#Ready de las máscaras
	Gas_Mask = %"GasMask-0"

func _process(_delta: float) -> void:
	move_and_slide()
	look_at_point()
	_Gas_Mask()

func look_at_point():
	var point_global = point
	get_node("Walt/Pivot").look_at(point_global)
	point = Cursor.global_position
	point_global = Cursor
	if point_global:
		pass

func _on_idle_state_processing(_delta: float) -> void:
	if %Brazo.flip_h == false:
		anim.play("Hands_2")
	if %Brazo.flip_h == true:
		anim.play("Hands")
	if Input.is_action_pressed("ui_right") or Input.is_action_pressed("ui_left"):
		anima.send_event("To_Walk")

func _on_interact_state_entered() -> void:
	if %Brazo.flip_h == false:
		anim.play("Interact") 
	if %Brazo.flip_h == true:
		anim.play("Interact_2")
	anim.send_event("To_Idle")

func _on_interact_state_processing(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_right") or Input.is_action_just_pressed("ui_left"):
		anima.send_event("To_Walk")

func _on_walk_state_processing(_delta: float) -> void:
	#if is_on_floor():
		var Directionx =  Input.get_axis("ui_left","ui_right")
		if Directionx:
			velocity.x = Directionx * Speed
		else:
			velocity.x = move_toward(velocity.x,0,Speed)
		if velocity == repose:
			anima.send_event("To_idle")

		var Directiony = Input.get_axis("ui_up","ui_down")
		if Directiony:
			velocity.y = Directiony * Speed
		else:
			velocity.y = move_toward(velocity.y,0,Speed)
		if velocity == repose:
			anima.send_event("To_idle")

		if Input.is_action_pressed("ui_left"):
			#velocity.x =- Speed
			%Patotas.flip_h = true
			%Corpse.play("Walk_I") 

		if Input.is_action_pressed("ui_right"):
			#velocity.x =+ Speed
			%Patotas.flip_h = false
			%Corpse.play("Walk_D") 

func _on_walk_state_entered() -> void:
	pass #if is_on_floor():

func _Gas_Mask():
#Offset de las Skins agregadas
	Gas_Mask.flip_h = %Brazo.flip_h
	if %Brazo.flip_h == true:
		Gas_Mask.offset.x = 30
		Gas_Mask.offset.y = 25
		Gas_Mask.rotation = -0.09
	else:
		Gas_Mask.offset.x = 285
		Gas_Mask.offset.y = 0
		Gas_Mask.rotation = 0.09
