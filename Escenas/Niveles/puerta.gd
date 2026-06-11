extends Area2D

@export_file("*.tscn")
var next_scene_path: String

func _on_body_entered(body):
	if body is CharacterBody2D:
		change_scene()

func change_scene():
	Global.siguiente_escena = next_scene_path
	get_tree().change_scene_to_file("res://pantalladecarga.tscn")
