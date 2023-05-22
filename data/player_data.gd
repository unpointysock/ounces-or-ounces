extends Resource
class_name PlayerData

var save_folder: String
var player_name : String

var l1_completed : bool
var l2_completed : bool
var l3_completed : bool
var l4_completed : bool
var l5_completed : bool

func get_data_as_dict() -> Dictionary :
  var data = {
	"save_folder" : save_folder,
	"player_name" : player_name,
	"l1_completed" : l1_completed,
	"l2_completed" : l2_completed,
	"l3_completed" : l3_completed,
	"l4_completed" : l4_completed,
	"l5_completed" : l5_completed,
  }
  return data
