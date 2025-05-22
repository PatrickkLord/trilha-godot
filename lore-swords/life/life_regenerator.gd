extends Node2D

@export var regeneration_amount: int = 20

var area2D: Area2D

func _ready():
	area2D = $Area2D.body_entered.connect()
	
func on_body_entered(body: Node2D) -> void:
	pass
