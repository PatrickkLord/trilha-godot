class_name Enemy 
extends Node2D

@export var health: int = 10
@export var death_prefab: PackedScene
 
func damage(amount: int) -> void:
	health -= amount
	print("inimigo atingido",amount, "A vida total é", health )
	
	if health<= 0:
		die()
		
func die() -> void:
	if death_prefab:
		var death_object = death_prefab.instantiate()
		death_object.position = position
		get_parent().add_child(death_object)
			
	queue_free()		
		
