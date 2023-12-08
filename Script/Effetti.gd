extends Control # Effetti

@onready var animation_player = $ColorRect/AnimationPlayer as AnimationPlayer


func _on_player_danneggiato(scudo_rimanente: int):
	animation_player.play("Danneggiato")
