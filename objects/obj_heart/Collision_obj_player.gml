if (global.player_lives < global.max_lives) {
    global.player_lives += 1;
    // Play a "ding" sound here tomorrow!
    instance_destroy();
}