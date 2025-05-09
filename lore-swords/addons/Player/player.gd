extends CharacterBody2D

@export var speed: float = 5.0  # Ajuste para pixels por segundo
@onready var animation_player: AnimationPlayer = $AnimationPlayer

var is_running : bool = false
var is_attacking : bool = false
var attack_cooldown: float = 0.0
var attack_duration: float = 0.0

func _process(delta: float) -> void:
	# Atualiza o temporizador de cooldown
	attack_cooldown -= delta
	if attack_cooldown < 0.0:
		is_attacking = false
		animation_player.play("idle")

func _physics_process(delta: float) -> void:
	var input_vector = Input.get_vector("mover_esquerda", "mover_direita", "mover_cima", "mover_baixo")
	var target_velocity = input_vector * speed
	
	# Ajusta o fator de interpolação com base na presença de entrada
	var lerp_factor = 0.1 if input_vector != Vector2.ZERO else 0.3
	
	velocity = lerp(velocity, target_velocity, lerp_factor)
	move_and_slide()

	if input_vector != Vector2.ZERO:
		animation_player.play("run")
	else:
		animation_player.play("idle")

	# Verifica se a tecla de ataque foi pressionada
	if Input.is_action_just_pressed("ataque") and not is_attacking:
		attack()

func attack() -> void:
	# Se já estiver atacando, não faz nada
	if is_attacking:
		return
	
	# Executa a animação de ataque
	animation_player.play("ataque_cima-baixo")
	
	# Marca que o personagem está atacando
	is_attacking = true
	attack_cooldown = attack_duration  # Define o cooldown para a duração do ataque
