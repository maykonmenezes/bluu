extends Area2D


func _on_coin_body_entered(body):
	if has_node('../cameras/cam'):
		$'../cameras/cam'.targets.erase(self)
	queue_free()
	get_tree().change_scene("res://Scenes/GameOver.tscn")
