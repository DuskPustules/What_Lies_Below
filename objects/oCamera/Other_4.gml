//Exit if player isn't loaded
if !instance_exists(oPlayer) {exit;}

//Camera Size
var camHeight = camera_get_view_height(view_camera[0]);
var camWidth = camera_get_view_width(view_camera[0]);

//Camera Coordinates
var camX = oPlayer.x - camWidth/2
var camY = oPlayer.y - camHeight/2

// Check all left blockers
with (oCameraLeftBlocker) {
    if (bbox_right > camX && bbox_right < camX + camWidth && !(bbox_bottom < camY || bbox_top > camY + camHeight)) {
        camX = max(camX, bbox_right); // Adjust camX only if within range
    }
}

// Check all right blockers
with (oCameraRightBlocker) {
    if (bbox_left < camX + camWidth && bbox_left > camX && !(bbox_bottom < camY || bbox_top > camY + camHeight)) {
        camX = min(camX, bbox_left - camWidth); // Adjust camX only if within range
    }
}

// Check all up blockers
with (oCameraUpBlocker) {
    if (bbox_bottom > camY && bbox_bottom < camY + camHeight && !(bbox_right < camX || bbox_left > camX + camWidth)) {
        camY = max(camY, bbox_bottom); // Adjust camY only if within range
    }
}

with (oCameraDownBlocker) {
    if (bbox_top < camY + camHeight && bbox_top > camY && !(bbox_right < camX || bbox_left > camX + camWidth)) {
        camY = min(camY, bbox_top - camHeight);
    }
}

//Camera Constraints to Room Borders
camX = clamp(camX, 0, room_width - camWidth)
camY = clamp(camY, 0, room_height - camHeight)

//Correctly set camera at room start
finalCamX = camX;
finalCamY = camY;