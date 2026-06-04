extends CanvasLayer

func _ready():
	hide()

func _input(event):
	if event.is_action_pressed("pausa"):
		cambiar_estado_pausa()

func cambiar_estado_pausa():
	if get_tree().paused:
		get_tree().paused = false
		hide()
	else:
		get_tree().paused = true
		show()


func _on_continuar_pressed() -> void:
	cambiar_estado_pausa()

func _on_salir_pressed() -> void:
	get_tree().quit()
