// ==============================================
//  oController → Step
//  (Master game logic)
// ==============================================

if (instance_exists(oHelpOverlay)) {
    var overlay = instance_find(oHelpOverlay, 0);
    if (overlay.visible) exit; // skip world updates while paused
}

// 1️⃣  --- Typing Input System ---

// Gather keyboard input (once per press)
for (var key = ord("A"); key <= ord("Z"); key++) {
    if (keyboard_check_pressed(key)) {
        global.typed += chr(key);
    }
}

// Backspace (once)
if (keyboard_check_pressed(vk_backspace)) {
    if (string_length(global.typed) > 0) {
        global.typed = string_delete(global.typed, string_length(global.typed), 1);
    }
}

// Submit word (Enter)
if (keyboard_check_pressed(vk_enter)) {
    var submission = string_upper(global.typed);

    // 🪞 Easter Egg: typing HERO kills you
    if (submission == "HERO") {
        with (oHero) {
            if (!dead) {
                dead = true;
                xspd = 0;
                yspd = 0;
                word_display = "DEAD";
                shake = 12; // dramatic shake
            }
        }
		
		// create game-over overlay once
        if (!instance_exists(oGameOver)) {
            instance_create_layer(x, y, "Instances", oGameOver);
        }
        show_debug_message("The word HERO collapses into DEAD.");
    }

    // 💥 Otherwise: (for now, just log it — we'll add projectile firing later)
    else if (string_length(submission) > 0) {
    var cost = string_length(submission);

    if (global.letters >= cost) {
        global.letters -= cost; // spend ammo

        var word_used = false;

        // 🔥 Check against all enemy words
        with (oEnemyWord) {
            if (string_upper(word_text) == submission) {
                instance_destroy();
                word_used = true;
                var flash = instance_create_layer(x, y, "Instances", oLetterPopup);
                flash.amount = 0;
                flash.message = "Overcame " + word_text + "!";
            }
        }

        // 💔 Check against friendly names (betrayal)
        with (oNPC) {
		    if (string_upper(name_tag) == submission && !fading) {
		        betrayed = true; // ✅ THIS LINE is crucial
		        line = "Why...?";
		        fading = true;
		        fade_alpha = 1;
		        fade_speed = 0.04;
		        word_used = true;
		    }
		}

        // if word did nothing
        if (!word_used) {
            var flash = instance_create_layer(oHero.x, oHero.y - 40, "Instances", oLetterPopup);
            flash.amount = 0;
            flash.message = "No effect.";
        }

    } else {
        global.flash_timer = 30; // show "NO LETTERS!"
    }
}

    // Clear typed buffer
    global.typed = "";
}



// 2️⃣  --- Enemy Word Spawning ---
// --- Enemy Wave System ---
if (!oHero.dead && !global.wave_cleared) {

    // spawn enemies up to total and screen limit
    if (instance_number(oEnemyWord) < global.max_enemies_on_screen &&
        global.enemies_spawned < global.enemies_per_wave) {

        // spawn chance
        if (irandom(60) == 0) { // roughly once per second
            var side = irandom(3);
            var px, py;

            switch (side) {
                case 0: // from left
                    px = -50;
                    py = irandom(room_height);
                    break;

                case 1: // from right
                    px = room_width + 50;
                    py = irandom(room_height);
                    break;

                case 2: // from top
                    px = irandom(room_width);
                    py = -50;
                    break;

                case 3: // from bottom
                    px = irandom(room_width);
                    py = room_height + 50;
                    break;
            }

            instance_create_layer(px, py, "Instances", oEnemyWord);
            global.enemies_spawned += 1;
        }
    }

    // wave complete when all enemies defeated
    var enemies_remaining = global.enemies_per_wave - global.enemies_killed;
    if (enemies_remaining <= 0 && instance_number(oEnemyWord) == 0) {
        // ✅ spawn the visual message once
	    if (!instance_exists(oWaveNotice)) {
	        var msg = instance_create_layer(room_width / 2, room_height / 2, "Instances", oWaveNotice);
	        msg.text = "WAVE " + string(global.wave_number) + " CLEARED!";
	    }
		
		global.wave_cleared = true;
        global.wave_timer = 180; // small pause before next wave
    }
}
// --- Start next wave after delay ---
if (global.wave_cleared) {
    global.wave_timer -= 1;
    if (global.wave_timer <= 0) {
        global.wave_number += 1;

        // scale difficulty
        global.enemies_per_wave += 5;
        global.max_enemies_on_screen = min(global.max_enemies_on_screen + 1, 10);

        // reset counters
        global.enemies_spawned = 0;
        global.enemies_killed = 0;
        global.wave_cleared = false;
    }
}

// run timer
if (!variable_global_exists("npc_spawn_timer")) global.npc_spawn_timer = 0;
global.npc_spawn_timer += 1;

// spawn roughly every 2–4 seconds (random)
var spawn_interval = irandom_range(120, 240);
if (!oHero.dead && global.npc_spawn_timer >= spawn_interval) {
    global.npc_spawn_timer = 0;

    // grid parameters (same as initial layout)
    var cell_size = 120;  // adjust to match your existing NPC spacing
    var margin = 80;

    // compute how many grid cells fit
    var cols = floor((room_width  - margin * 2) / cell_size);
    var rows = floor((room_height - margin * 2) / cell_size);

    // pick random grid cell
    var grid_x = irandom(cols - 1);
    var grid_y = irandom(rows - 1);

    // convert to world coordinates (centered on cell)
    var px = margin + grid_x * cell_size + cell_size / 2;
    var py = margin + grid_y * cell_size + cell_size / 2;

    // make sure it doesn’t overlap an existing NPC
    if (!instance_position(px, py, oNPC)) {
        var npc = instance_create_layer(px, py, "Instances", oNPC);
        npc.letter_reward = irandom_range(3, 8);
        npc.name_tag = npc_names[irandom(array_length(npc_names) - 1)];
        npc.line = npc_lines[irandom(array_length(npc_lines) - 1)];
    }
}