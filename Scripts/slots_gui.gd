extends Panel

@onready var BackGroundSprite: Sprite2D = $BackGround
@onready var itemSprite: Sprite2D = $CenterContainer/Panel/Item

func update(item:InvItem):
	if !item:
		BackGroundSprite.frame = 0
		itemSprite.visible = false
		
	else:
		BackGroundSprite.frame = 1
		itemSprite.visible = true
		itemSprite.texture = item.texture
