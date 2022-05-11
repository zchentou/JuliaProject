module main_stuff

include("julia_euchre_structs.jl")
# using euchre_structures
# another way to do it here

# check subtypes work
simple_eg = euchre_structures.Simple()
println("Simple's Name: ", simple_eg.name)
println("Simple's Hand: ", simple_eg.hand)

michael_eg = euchre_structures.Human("Michael", [10,12,32,2])
println("Michael's Name: ", michael_eg.name)
println("Michael's Hand: ", michael_eg.hand)

# using simple function using 2 objects
# simple_hand_better_vs_michael = euchre_structures.betterHand(simple_eg.hand, michael_eg.hand)
println("Simple's hand is better than Michael's: ", euchre_structures.betterHand(simple_eg.hand, michael_eg.hand))

zach_eg = euchre_structures.Human("Zach", [1,6,5,2])
println("Zach's Name: ", zach_eg.name)
println("Zach's Hand: ", zach_eg.hand)

# examples of methods
# michael_hand_better_vs_zach = euchre_structures.betterHand(michael_eg.hand, zach_eg.hand)
println("Michael's hand is better than Zach's: ", euchre_structures.betterHand(michael_eg.hand, zach_eg.hand))
println("Zach's hand size: ", euchre_structures.get_hand_size(zach_eg))
println("Michael's hand size: ", euchre_structures.get_hand_size(michael_eg))
# zach_cards = euchre_structures.get_cards_hand(zach_eg)
# println("Zach's cards: ", euchre_structures.get_cards_hand(zach_eg))
# for


# NOW, show how MD is super useful
# Let's say someone likes our Player class, wants to add some methods to it though..., look at new method in julia_eucre_structs.jl

# can still reuse our classes
chuck_eg = euchre_structures.Human("Chuck", [1,6,5,3,20,40])
alex_eg = euchre_structures.Human("Alex", [10,12,32,2])

# can still use old method(s) that are useful
# chuck_hand_better_than_alex_hand = euchre_structures.betterHand(chuck_eg.hand, alex_eg.hand)
println("Chuck's hand is better than Alex's: ", euchre_structures.betterHand(chuck_eg.hand, alex_eg.hand))
println("Chuck's hand size: ", euchre_structures.get_hand_size(chuck_eg))
println("Alex's hand size: ", euchre_structures.get_hand_size(alex_eg))

# can use our new method here without having to inherit a class, code reusing is much easier (see why in more detail under my video notes of MD in julia_notes.jl)
println("Chuck's hand compared to Alex's: ", euchre_structures.smaller_or_bigger_hand(chuck_eg, alex_eg))

end


