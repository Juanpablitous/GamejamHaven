
extends Node2D
var firewall = preload("res://assets/tileset/firewall-warningtrans.tscn")
var tiempo = 0
var i = 0
var k = 2
var m = 0
var fw

func _physics_process(delta: float) -> void:
		var a = 1
		if (tiempo < 20):
				tiempo = tiempo +1 
		else: 
				_atak(0)

				
		
	

func _atak(delta: float) -> void:
	if m < 10:
		if (tiempo < 20):
			tiempo = tiempo +1
		else:
			var n = 1
			fw = firewall.instantiate()
			fw.position.x= randi_range (-600,600)
			fw.position.y = randi_range(-300,300)
			add_child(fw)
			tiempo = 0
		m+=1
	else:
		await get_tree().create_timer(10.0).timeout
		m = 0
		_atak(0)
