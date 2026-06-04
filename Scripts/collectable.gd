extends Area2D


@export var itemsRes: InvItem

func collect(inventory: Inv):
	inventory.insert(itemsRes)
	queue_free()
