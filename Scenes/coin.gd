extends Area2D


func _on_coin_body_entered(body):
	$'anim2'.play('pickup')
	$'audio'.play()
	get_tree().call_group('ui', 'update_coins')
