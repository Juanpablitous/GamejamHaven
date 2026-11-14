extends CharacterBody2D

var mouse_fin = 0
var Maxpower = 8
var power : float = 0.0
var power_dir : int = 1
const SPEED = 300.0
const JUMP_VELOCITY = -400.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()


func _process(_delta):
	#use mouse to rotate the cue
	var mouse_pos := get_viewport().get_mouse_position()
	look_at(mouse_pos)
	#check for mouse clicks
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		pos_fin = mouse_pos
		
			



		
