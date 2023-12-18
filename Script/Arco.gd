extends StaticBody2D #Arco

@export_enum("destra", "sotto", "sinistra", "sopra") var direzione : int = 0
@export var tempo_prima_sparo : float = 1.0
@export var tempo_dopo_sparo : float = 1.0


@onready var contenitore_frecce = $ContenitoreFrecce as Node
@onready var animation_player = $AnimationPlayer as AnimationPlayer
@onready var freccia = $Sprite2D/Freccia as Sprite2D


var animazioni : Array[String] = ["SparaDestra", "SparaSotto", "SparaSinistra", "SparaSopra"]
var can_start : bool = true


func _spara() -> void:
	var scena_freccia = load("res://Scene/Freccia.tscn")
	var nuova_freccia = scena_freccia.instantiate()
	
	nuova_freccia.global_position = global_position + Vector2(0, -13)
	nuova_freccia.direzione = direzione
	
	contenitore_frecce.add_child(nuova_freccia)


func start() -> void:
	can_start = false
	
	await get_tree().create_timer(tempo_prima_sparo).timeout
	animation_player.play(animazioni[direzione])
	await get_tree().create_timer(tempo_dopo_sparo).timeout
	
	can_start = true


func _process(delta: float) -> void:
	if can_start:
		start()
