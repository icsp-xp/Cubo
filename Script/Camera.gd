extends Camera2D

@onready var animation_player = $AnimationPlayer


func _on_player_danneggiato() -> void:
	animation_player.play("shakeCamera")


func _on_uscita_chiavi_prese() -> void:
	animation_player.play("shakeCamera")
