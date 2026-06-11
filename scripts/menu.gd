extends Control

@onready var sonido_click = $SonidoClick
var settings_scene = preload("res://scenes/settings.tscn")

func _on_play_pressed() -> void:
	sonido_click.play()
	await get_tree().create_timer(0.2).timeout
	MusicManager.player.stop()
	get_tree().change_scene_to_file("res://Escenas/Niveles/nivel1.tscn")

func _on_settings_pressed() -> void:
	sonido_click.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_packed(settings_scene)

func _on_quit_pressed() -> void:
	sonido_click.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().quit()
