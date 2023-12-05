extends Area2D #Paletti

@export var tempo_di_attivazione : float = 1.0
@export var tempo_da_attivato : float = 1.0
@export var tempo_da_disattivato : float = 1.0
@export var danno : int = 1

@onready var animation_player = $AnimationPlayer as AnimationPlayer

var can_start : bool = true


func start() -> void:
	can_start = false
	
	await get_tree().create_timer(tempo_di_attivazione).timeout
	animation_player.play("In")
	await animation_player.animation_finished
	await get_tree().create_timer(tempo_da_attivato).timeout
	animation_player.play("Out")
	await animation_player.animation_finished
	await get_tree().create_timer(tempo_da_disattivato).timeout
	
	can_start = true


func _process(delta: float) -> void:
	if can_start:
		start()

