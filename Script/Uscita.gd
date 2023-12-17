extends Marker2D # Uscita

signal chiavi_prese()

@onready var collision_shape_2d = $AreaUscita/CollisionShape2D as CollisionShape2D
@onready var audio_prossimo_livello = $AudioProssimoLivello as AudioStreamPlayer

var puo_uscire : bool = false


func _on_player_presa_chiave() -> void:
	if ScriptGlobale.numero_corrente_di_chiavi <= 0:
		audio_prossimo_livello.play()
		chiavi_prese.emit()
		collision_shape_2d.call_deferred("set_disabled", false)


func _on_area_uscita_area_entered(area : Area2D) -> void:
	if area.is_in_group("AreaControllo"):
		puo_uscire = true


func _on_area_uscita_area_exited(area : Area2D) -> void:
	if area.is_in_group("AreaControllo"):
		puo_uscire = false
