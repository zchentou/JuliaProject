module main_structures
# export Player, Human, Simple, betterHand

abstract type Player end

# assume each card in a 52 card deck is represented by a number 1-52
# creating subtype Human-concrete, not abstract- of class Player, as mutable struct to be able to change values
mutable struct Human <: Player
    name::String
    hand::Array
        # like constructor of C++

    function Human(name="Default", hand::Array=[0,0,0,0])
        # first card 0, not allowed, means no hand was passed in, just default:
        # println(hand)
        # 1-indexed
        if hand[1] == 0
            for i = 1:4
                # println(typeof(hand[i]))
                # just looking at anonymous / lambda function, left side of it could be anything here, returns on right side of arrow
                # println(typeof((i) -> (i)))
                hand[i] = i
            end
        end
        # println(hand)
        new(name, hand)
    end
end

# creating subtype-concrete, not abstract- Simple of class Player, as mutable struct to be able to change values
mutable struct Simple <: Player 
    name::String
    hand::Array

    # like constructor of C++
    function Simple(name="Default", hand::Array=[0,0,0,0])
        # first card 0, not allowed, means no hand was passed in, just default:
        # println(hand)
        if hand[1] == 0
            hand[1] = 1  
            hand[2] = 2
            hand[3] = 3
            hand[4] = 4
        end
        # println(name)
        new(name, hand)
    end

end

function betterHand(hand1::Array, hand2::Array)
    sum1 = 0
    for i = 1:size(hand1)[1]
        sum1 += hand1[i]
    end
    sum2 = 0
    for i = 1:size(hand2)[1]
        sum2 += hand2[i]
    end
    # don't need to say we are returning, automatically returns last statement
    # println(sum1)
    # println(sum2)
    sum1 > sum2
end

end

