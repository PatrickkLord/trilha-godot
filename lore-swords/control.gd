extends Control
@onready var contador_carne: Label = $MarginContainer/carne/contador_carner as Label
@onready var contador_vida: Label = $MarginContainer/Vidas/contador_vida as Label
@onready var contador_time: Label = $MarginContainer/tempo/contador_time as Label
@onready var clock_timer: Timer = $clock_Timer as Timer

var minutes = 0
var seconds = 0

@export_range (0,5) var default_minutes := 1
@export_range (0,59) var default_seconds := 0

signal time_is_up()


func _ready() -> void:
	contador_carne.text = str(Global.carne)
	contador_time.text = str("%02d" % default_minutes) + ":" + str("%02d" % default_seconds)
	reset_clock_timer()
	
	
func reset_clock_timer():
	minutes = default_minutes
	seconds = default_seconds
	
	
func _process(delta: float) -> void:
	contador_carne.text = str(Global.carne)
	if minutes == 0 and seconds ==0:
		emit_signal("time_is_up")

func _on_clock_timer_timeout() -> void:
	if seconds == 0:
		if minutes > 0:
			minutes -=1
			seconds = 60
	seconds -=1
	contador_time.text = str("%02d" % default_minutes) + ":" + str("%02d" % default_seconds)
