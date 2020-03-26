extends Area2D


func _on_coin_body_entered(body):
	if has_node('../cameras/cam'):
		$'../cameras/cam'.targets.erase(self)
	get_tree().call_group('ui', 'on_portal')

