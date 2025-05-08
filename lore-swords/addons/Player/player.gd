extends CharacterBody2D

@export var speed: float = 3.0
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("mover_esquerda", "mover_direita", "mover_cima", "mover_baixo")
	var target_velocity = input_vector * speed * 100.0
	
	velocity = lerp(velocity, target_velocity, 0.05)
	move_and_slide()

	if input_vector != Vector2.ZERO:
		animation_player.play("run")
	else:
		animation_player.play("idle")
	
