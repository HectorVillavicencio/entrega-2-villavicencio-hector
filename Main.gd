extends Node

func _ready():
	$Player.set_projectile_container(self)
	$Torreta.set_values($Player, self)
