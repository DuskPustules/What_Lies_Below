for (var i = 0; i < ds_list_size(global.brokenWalls); i++) {
    var wall_data = global.brokenWalls[| i];
    if wall_data[? "room"] == room {
        var wall_x = wall_data[? "x"];
        var wall_y = wall_data[? "y"];
        var wall_instance = instance_position(wall_x, wall_y, oWallBreak);
        if wall_instance != noone {
            instance_destroy(wall_instance);
			if room == rmItemCorridor1 {
				instance_destroy(oCameraRightBlocker);
			}
        }
    }
}