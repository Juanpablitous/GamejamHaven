extends Area2D
var tiempo = 0
@onready var warning: Sprite2D = $Warning
@onready var firewalls: Sprite2D = $Firewalls
@onready var ball: Node2D = $Ball



# Called when the node enters the scene tree for the first time.
func _physics_process(delta: float) -> void:
	if (tiempo < 150):
		tiempo = tiempo +1
		firewalls.visible = false
		warning.visible = true
	else:
		firewalls.visible = true
		warning.visible = false
		tiempo = tiempo +1
		if (tiempo > 200):
			firewalls.visible = false
			warning.visible = false
		
	pass # Replace with function body.

func _on_cue_shoot(power):
	ball.apply_central_impulse(power)

# Called every frame. 'delta' is the elapsed time since the previous frame.

	pass
