
extends CharacterBody2D

@export var speed = 300.0
@export var dash_speed = 900.0
@export var dash_duration = 0.2
@export var bounce_force = 900.0

var is_dashing = false
var dash_timer = 0.0
var dash_direction = Vector2.ZERO

func _physics_process(delta):
	var direction = Vector2.ZERO

	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")

	# Activar dash
	if Input.is_action_just_pressed("ui_accept") and not is_dashing:
		if direction != Vector2.ZERO:
			dash_direction = direction.normalized()
			is_dashing = true
			dash_timer = dash_duration

	# Movimiento
	if is_dashing:
		velocity = dash_direction * dash_speed
		dash_timer -= delta

		if dash_timer <= 0:
			is_dashing = false
	else:
		velocity = direction.normalized() * speed

	move_and_slide()

	# Detectar choque y rebotar
	if is_dashing and get_slide_collision_count() > 0:
		var collision = get_slide_collision(0)
		var normal = collision.get_normal()

		velocity = dash_direction.bounce(normal) * bounce_force
		dash_direction = velocity.normalized()

		is_dashing = false
