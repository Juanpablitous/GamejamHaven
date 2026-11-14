extends Node2D
var firewall = preload("res://assets/tileset/firewall-warningtrans.tscn")
var tiempo = 0
var i = 0

func _physics_process(delta: float) -> void:
	var a = 1
	if (tiempo < 1000):
			tiempo = tiempo +1
	else: 
		while i < 50:
			_atak(0)
			i = i+1
	
# Called when the node enters the scene tree for the first time.
func _atak(delta: float) -> void:
		if (tiempo < 1000):
			tiempo = tiempo +1
		else:
			var fw = firewall.instantiate()
			fw.position.x= randi_range (-600,600)
			fw.position.y = randi_range(-300,300)
			add_child(fw)
			tiempo = 0
