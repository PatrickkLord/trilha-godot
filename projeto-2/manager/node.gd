extends Node2D

#func _ready() -> void:
	#pass
	#
#func _process(delta: float) -> void:
	#pass
#	PARTE 1	
func _input(event: InputEvent) -> void:
#	input no botao e um enevnto de click
	if event is InputEventMouseButton:
		if event.button_index ==1:
			if event.pressed:
				spaw_object	()
					
			
		
func spaw_object(event.position: vector2)-> void:
	
	pass
			
