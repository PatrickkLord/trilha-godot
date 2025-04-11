extends Node2D

@export var object_templantes: Array[PackedScene]

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
				spaw_object	(event.position)
					
			
func spaw_object(position: Vector2) -> void:
	var index: int = randi_range(0, object_templantes.size() -1)
	var object_templante = object_templantes[index]
	var object: RigidBody2D = object_templante.instantiate()
	object.position = position
	add_child(object)
	
	pass
			
