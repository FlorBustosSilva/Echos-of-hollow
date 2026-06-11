extends Control

@onready var volume_slider = $VBoxContainer/HSlider
@onready var sonido_click = $SonidoClick

func _ready():
	if !MusicManager.player.playing:
		MusicManager.player.play(1.6)
	volume_slider.value = db_to_linear(AudioServer.get_bus_volume_db(0))
	volume_slider.value_changed.connect(_on_volume_changed)

func _on_volume_changed(value):
	AudioServer.set_bus_volume_db(0, linear_to_db(value))

func _on_back_pressed() -> void:
	sonido_click.play()
	await get_tree().create_timer(0.2).timeout
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
