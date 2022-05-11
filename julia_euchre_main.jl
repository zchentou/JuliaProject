module main_stuff
include("julia_adding_to_player.jl")
include("julia_euchre.jl")

# check it works
simple_eg = Simple()
println("Simple's Name: ", simple_eg.name)
println("Simple's Hand: ", simple_eg.hand)

# eg_hand = Array{Int, 4}
michael_eg = Human("Michael", [10,12,32,2])
println("Michael's Name: ", michael_eg.name)
println("Michael's Hand: ", michael_eg.hand)

# using simple function using 2 objects
simple_hand_better_than_michael_hand = betterHand(simple_eg.hand, michael_eg.hand)
println("Simple's hand is better than Michael's: ", simple_hand_better_than_michael_hand)

zach_eg = Human("Zach", [1,6,5,2])
println("Zach's Name: ", zach_eg.name)
println("Zach's Hand: ", zach_eg.hand)

michael_hand_better_than_zach_hand = betterHand(michael_eg.hand, zach_eg.hand)
println("Michael's hand is better than Zach's: ",michael_hand_better_than_zach_hand)

# NOW, show how MD is super useful
# Let's say someone likes our Player class, wants to add some methods to it though..., look at julia_adding_to_player.jl

# can still reuse our classes
chuck_eg = Human("Chuck", [1,6,5,3,20,40])
alex_eg = Human("Alex", [10,12,32,2])

# can still use old method(s) that are useful
chuck_hand_better_than_alex_hand = betterHand(chuck_eg.hand, alex_eg.hand)
println("Chuck's hand is better than Alex's: ",chuck_hand_better_than_alex_hand)

# can use our new method here without having to inherit a class, code reusing is much easier (see why in more detail under my video notes of MD in julia_notes.jl)
println("Chuck's hand compared to Alex's: ", smaller_or_bigger_hand(chuck_eg, alex_eg))



