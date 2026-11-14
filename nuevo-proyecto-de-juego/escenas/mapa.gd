extends Node2D
var firewall = preload("res://escenas/firewall-warningtrans.tscn")
var tiempo = 0
var i = 0
@onready var ball: Node2D = $Ball

func _physics_process(delta: float) -> void:
		if (tiempo < 1000):
			tiempo = tiempo +1
		else:
			var fw = firewall.instantiate()
			fw.position.x= randi_range (-600,600)
			fw.position.y = randi_range(-300,300)
			add_child(fw)
			tiempo = 0
	
			
