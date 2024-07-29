#
#> CREATED ON: 2019-02-04
#> AUTHOR: Firebug
#> Load main logic mcfunction each tick.
#

execute as @e[type=minecraft:minecart] at @s if entity @p[distance=..1] run function racecarts:startcart
