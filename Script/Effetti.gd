extends Control # Effetti

@onready var animation_color = $ColorRect/AnimationColor as AnimationPlayer
@onready var animation_bagliore = $Bagliore/AnimationBagliore as AnimationPlayer


func _on_player_danneggiato() -> void:
	animation_color.play("Danneggiato")


func _on_uscita_chiavi_prese() -> void:
	animation_bagliore.play("BaglioreIn")
	await animation_bagliore.animation_finished
	animation_bagliore.play("LampeggiaBagliore")
