/// @description Insert description here
// You can write your code in this editor

rollback_define_input(
{
        left: ord("A"),
        right: ord("D"),
        up: ord("W"),
        down: ord("S"),
        light: ord("I"),
        medium: ord("O"),
        heavy: ord("P"),
		beat: ord("K")
});


rollback_define_player(oFighter, "Instances");

if (!rollback_join_game())
{
        rollback_create_game(2, true);
}
p1 = 0
p2 = 0
fight_round = 1
p1_round = 0
p2_round = 0
