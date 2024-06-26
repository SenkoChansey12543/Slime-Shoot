extends Map

func _ready():
	get_tree().node_added.connect(node_added)

func node_added(node : Node):
	if node.is_in_group("Ladder"):
		node.map_to_enter = load("res://Scenes/Maps/desert_level.tscn")
		node.up = true
		node.connect("activated", _on_ladder_used)

func _on_ladder_used(_ladder):
	Vars.total_points += Vars.player.score
	if Vars.map_state_data != null:
		Vars.map_state_data.add_points_on_death = false
	Save_System.save_total_points()
