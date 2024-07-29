#
#> CREATED ON: 2019-02-04
#> AUTHOR: Firebug, toydotgame
#> Highly rewritten from Firebug's original. Throws you at 28 m/s in the cardinal
#> directions, but will slow down to Vanilla Motion[] values when hitting a corner
#> that _can_ be taken (corners that would be skipped over in Vanilla are here too).
#

execute store result score @s RacecartXSpeed run data get entity @s Motion[0] 100
execute store result score @s RacecartZSpeed run data get entity @s Motion[2] 100

#> Heading east
# E↔W rail
execute as @s[scores={RacecartXSpeed=50..}] at @s \
	if block ~1 ~ ~ #minecraft:rails[shape=east_west] \
	if entity @e[type=player,distance=..1] \
	run tp @s ~1 ~ ~
# SW rail
execute as @s[scores={RacecartXSpeed=50..}] at @s \
	if block ~1 ~ ~ minecraft:rail[shape=south_west] \
	if entity @e[type=player,distance=..1] \
	run data modify entity @s Motion set value [0.3d,0d,0d]
# NW rail
execute as @s[scores={RacecartXSpeed=50..}] at @s \
	if block ~1 ~ ~ minecraft:rail[shape=north_west] \
	if entity @e[type=player,distance=..1] \
	run data modify entity @s Motion set value [0.3d,0d,0d]

#> Heading west
# E↔W rail
execute as @s[scores={RacecartXSpeed=..-50}] at @s \
	if block ~-1 ~ ~ #minecraft:rails[shape=east_west] \
	if entity @e[type=player,distance=..1] \
	run tp @s ~-1 ~ ~
# SE rail
execute as @s[scores={RacecartXSpeed=..-50}] at @s \
	if block ~-1 ~ ~ minecraft:rail[shape=south_east] \
	if entity @e[type=player,distance=..1] \
	run data modify entity @s Motion set value [-0.3d,0d,0d]
# NE rail
execute as @s[scores={RacecartXSpeed=..-50}] at @s \
	if block ~-1 ~ ~ minecraft:rail[shape=north_east] \
	if entity @e[type=player,distance=..1] \
	run data modify entity @s Motion set value [-0.3d,0d,0d]

#> Heading south
execute as @s[scores={RacecartZSpeed=50..}] at @s \
	if block ~ ~ ~1 #minecraft:rails[shape=north_south] \
	if entity @e[type=player,distance=..1] \
	run tp @s ~ ~ ~1
# NE rail
execute as @s[scores={RacecartZSpeed=50..}] at @s \
	if block ~ ~ ~1 minecraft:rail[shape=north_east] \
	if entity @e[type=player,distance=..1] \
	run data modify entity @s Motion set value [0d,0d,0.3d]
# NW rail
execute as @s[scores={RacecartZSpeed=50..}] at @s \
	if block ~ ~ ~1 minecraft:rail[shape=north_west] \
	if entity @e[type=player,distance=..1] \
	run data modify entity @s Motion set value [0d,0d,0.3d]

#> Heading north
execute as @s[scores={RacecartZSpeed=..-50}] at @s \
	if block ~ ~ ~-1 #minecraft:rails[shape=north_south] \
	if entity @e[type=player,distance=..1] \
	run tp @s ~ ~ ~-1
# SE rail
execute as @s[scores={RacecartZSpeed=..-50}] at @s \
	if block ~ ~ ~-1 minecraft:rail[shape=south_east] \
	if entity @e[type=player,distance=..1] \
	run data modify entity @s Motion set value [0d,0d,-0.3d]
# SW rail
execute as @s[scores={RacecartZSpeed=..-50}] at @s \
	if block ~ ~ ~-1 minecraft:rail[shape=south_west] \
	if entity @e[type=player,distance=..1] \
	run data modify entity @s Motion set value [0d,0d,-0.3d]
