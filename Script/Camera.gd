extends Camera2D

@onready var animation_player = $AnimationPlayer


func _on_player_danneggiato():
	animation_player.play("shakeCamera")
