extends Node

var player: AudioStreamPlayer

func _ready():
	player = AudioStreamPlayer.new()
	add_child(player)
	player.stream = preload("res://Scripts/ideaMenu3.mp3")
	player.volume_db = -15.0
	
	player.play(1.6)

func stop():
	player.stop()
