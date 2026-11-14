extends CharacterBody2D

@export var speed = 300.0 # Nota: tenías 3000.0, que es más rápido que tu dash (1900.0)
@export var dash_speed = 1900.0
@export var dash_duration = 0.2
@export var bounce_force = 1900.0
@export var bounce_duration = 0.15 # Tiempo que dura el empujón del rebote

var is_dashing = false
var dash_timer = 0.0
var dash_direction = Vector2.ZERO

var bounce_timer = 0.0

func _physics_process(delta):
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("ui_left", "ui_right")
	direction.y = Input.get_axis("ui_up", "ui_down")

	# Si estamos en medio de un rebote, NO dejamos que el control normal sobrescriba velocity
	if bounce_timer > 0:
		bounce_timer -= delta
		# Opcional: hace que el personaje vaya frenando suavemente tras rebotar
		velocity = velocity.move_toward(Vector2.ZERO, 4000.0 * delta)
	else:
		# Activar dash
		if Input.is_action_just_pressed("ui_accept") and not is_dashing:
			if direction != Vector2.ZERO:
				dash_direction = direction.normalized()
				is_dashing = true
				dash_timer = dash_duration

		# Movimiento normal o dash
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
		is_dashing = false
		bounce_timer = bounce_duration # Activamos el tiempo de rebote
