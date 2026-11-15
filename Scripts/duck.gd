extends RigidBody2D

var velamais_izmers = Vector2(12, 12)

func _ready() -> void:
	$Sprite2D.texture = Main.izveleta_tekstura
	if $Sprite2D.texture != null:
		var attela_izmers = $Sprite2D.texture.get_size()
		$Sprite2D.scale = velamais_izmers / attela_izmers
