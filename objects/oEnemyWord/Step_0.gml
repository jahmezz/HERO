/// oEnemyWord → Step

// stop all enemy movement if hero is dead

// always wobble
float_t += 0.05;
y_offset = sin(float_t) * 3;  // small vertical oscillation

if (instance_exists(oHero) && oHero.dead) {
    vx = 0;
    vy = 0;
    exit; // stop logic, leave them frozen
}

if (instance_exists(oHelpOverlay)) {
    var overlay = instance_find(oHelpOverlay, 0);
    if (overlay.visible) exit; // skip world updates while paused
}


if (instance_exists(oHero)) {
    var dx = oHero.x - x;
    var dy = oHero.y - y;
    var dist = max(1, sqrt(dx*dx + dy*dy));

    vx += (dx / dist) * chase_accel;
    vy += (dy / dist) * chase_accel;
}

// --- repel nearby allies ---
with (oEnemyWord) {
    if (id != other.id) {
        var dx2 = other.x - x;
        var dy2 = other.y - y;
        var d2 = sqrt(dx2*dx2 + dy2*dy2);

        if (d2 < 40 && d2 > 5) {
            var dist_self  = point_distance(x, y, oHero.x, oHero.y);
            var dist_other = point_distance(other.x, other.y, oHero.x, oHero.y);
            if (dist_self > 30 || dist_other > 30) {
                other.vx += (dx2 / d2) * repel_strength;
                other.vy += (dy2 / d2) * repel_strength;
            }
        }
    }
}

// --- momentum ---
var spd = sqrt(vx*vx + vy*vy);
if (spd > max_speed) {
    vx = (vx / spd) * max_speed;
    vy = (vy / spd) * max_speed;
}

x += vx;
y += vy;

// --- collision with hero ---
if (instance_exists(oHero)) {
    if (point_distance(x, y, oHero.x, oHero.y) < 20) {
        if (!oHero.dead) {
            // mark hero dead once
            with (oHero) {
                dead = true;
                shake = 10;
                word_display = "DEAD";
            }
            instance_create_layer(room_width / 2, room_height / 2, "Instances", oGameOver);
        }
    }
}

// --- cleanup if offscreen ---
if (x < -100 || x > room_width + 100 || y < -100 || y > room_height + 100)
    instance_destroy();