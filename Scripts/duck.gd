extends RigidBody2D

var velamais_izmers = Vector2(12, 12)
@onready var skins = [$Orange, $BowlingBall, $Minion, $Monster, $Star, $Duck]
func _ready() -> void:
	choose_skin(Main.izveletais_skins)
	#$Sprite2D.texture = Main.izveleta_tekstura
	#if $Sprite2D.texture != null:
		#var attela_izmers = $Sprite2D.texture.get_size()
		#$Sprite2D.scale = velamais_izmers / attela_izmers


func choose_skin(selected:int):
	for i in range(skins.size()):
		if i==selected-1:
			skins[i].visible = true
			#anim_sprite=skins[i]
		else:
			skins[i].visible = false
