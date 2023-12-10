extends Control # Effetti

@onready var animation_player = $ColorRect/AnimationPlayer as AnimationPlayer


func _on_player_danneggiato() -> void:
	print("numero scudi corrente: ", ScriptGlobale.numero_corrente_di_scudi)
	animation_player.play("Danneggiato")
