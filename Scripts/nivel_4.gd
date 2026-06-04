extends Node2D







func _on_area_2d_body_entered(body: Node2D) -> void:
	if body is Player:
		var scene = load("res://Escenas/Niveles/nivel_6.tscn")
		
		get_tree().call_deferred("change_scene_to_packed", scene)
