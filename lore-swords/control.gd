extends Control

@onready var contador_carne: Label = $MarginContainer/carne/contador_carner as Label
@onready var contador_vida: Label = $MarginContainer/Vidas/contador_vida as Label
@onready var contador_time: Label = $MarginContainer/tempo/contador_time as Label

func _ready() -> void:
	contador_carne.text = str(Global.carne)

func _process(delta: float) -> void:
	contador_carne.text = str(Global.carne)
