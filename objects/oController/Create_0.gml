// --- 1️⃣ Start the game in a larger window (80% of display) ---
var screen_w = display_get_width();
var screen_h = display_get_height();

var target_w = screen_w * 0.8;
var target_h = screen_h * 0.8;

window_set_size(target_w, target_h);
window_center();

// --- 2️⃣ Base GUI resolution you designed for ---
global.base_gui_w = 1280;
global.base_gui_h = 720;

// --- 3️⃣ Auto-fit the GUI to the window proportionally ---
var win_w = window_get_width();
var win_h = window_get_height();

var aspect = global.base_gui_w / global.base_gui_h;
var gui_w, gui_h;

if (win_w / win_h > aspect) {
    gui_h = global.base_gui_h;
    gui_w = gui_h * (win_w / win_h);
} else {
    gui_w = global.base_gui_w;
    gui_h = gui_w / (win_w / win_h);
}

display_set_gui_size(gui_w, gui_h);


global.typed = "";
global.ammo = "";
global.textbox = instance_create_layer(0, 0, "Instances", oTextbox);
global.letters = 0;
global.flash_timer = 0; 

global.letters = 0;
global.flash_timer = 0;
global.game_paused = false;

global.wave_number = 1;
global.enemies_per_wave = 5;
global.max_enemies_on_screen = 6;

global.enemies_spawned = 0;
global.enemies_killed = 0;
global.wave_cleared = false;

// 🌟 FRIENDLY NAMES — a mix of family, friends, mentors, and peers
npc_names = [
    // family
    "Mom", "Dad", "Sis", "Bro", "Grandma", "Grandpa", "Uncle", "Auntie",
    // friends
    "Lena", "Ravi", "Mina", "Theo", "Grace", "Jin", "Ava", "Lucas", "Ella", "Noah",
    "Sofia", "Hana", "Leo", "Amir", "Nora", "June", "Eli", "Sara", "Kai", "Ben", "Maya", "Hiro", "Leah",
    // mentors / peers
    "Coach", "Prof. Emmet", "Alex", "Jordan", "Sam", "Taylor", "Rowan", "Em", "Zoe", "Daniel"
];


// 💬 MODERN ENCOURAGEMENT — short, warm, and personal
npc_lines = [
    // family tone
    "We're so proud of you.",
    "Take a breath, we're right here.",
    "You're doing awesome.",
    "You've come so far already.",
    "You don't have to do it alone.",
    "We see how hard you try.",
    "You've got more strength than you think.",
    "You're not alone!",
    "We believe in you.",

    // friends tone
    "Hey, you got this.",
    "Look at you go!",
    "You're doing better than you think.",
    "Don't forget to rest sometimes.",
    "I've got your back.",
    "We'll get through this together.",
    "Proud of you, seriously.",
];


// spawn grid (columns)
var cols = 3;
var rows = 3;
var spacing_x = room_width / (cols + 1);
var spacing_y = room_height / (rows + 1);

var idx = 0;
for (var i = 1; i <= cols; i++) {
    for (var j = 1; j <= rows; j++) {
        var px = i * spacing_x;
        var py = j * spacing_y;
        var npc = instance_create_layer(px, py, "Instances", oNPC);

        npc.name_tag = npc_names[irandom(array_length(npc_names) - 1)];
        npc.line = npc_lines[irandom(array_length(npc_lines) - 1)];
        npc.letter_reward = irandom_range(3, 8);
        idx++;
    }
}

// initialize objects
for (var i = 0; i < 100; i++) {
    instance_create_depth(oHero.x + irandom_range(-400, 400),
                          oHero.y + irandom_range(-300, 300),
                          1000, oDust);
}

// Spawn a few early enemies for atmosphere
for (var i = 0; i < 3; i++) {
    var side = irandom(3);
    var px, py;

    switch (side) {
        case 0: px = -50; py = irandom(room_height); break;
        case 1: px = room_width + 50; py = irandom(room_height); break;
        case 2: px = irandom(room_width); py = -50; break;
        case 3: px = irandom(room_width); py = room_height + 50; break;
    }

    instance_create_layer(px, py, "Instances", oEnemyWord);
}

global.enemies_spawned += 3;

instance_create_layer(0, 0, "Instances", oHelpOverlay);