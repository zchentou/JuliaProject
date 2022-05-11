module someone_elses_stuff
# using main_stuff

# now this file will add method to that use Player class
function smaller_or_bigger_hand(player1::Player, player2::Player)
    println(size(player1.hand)[1])
    println(size(player2.hand)[1])
    if size(player1.hand)[1] < size(player2.hand)[1]
        return "It is a smaller hand, there are less cards in this hand for this player compared to the other player's."
    elseif size(player1.hand)[1] == size(player2.hand)[1]
        return "It is a hand of the same size, there are the same amount of cards in this hand for this playercompared to the other player's."
    else
        return "It is a bigger hand, there are more cards in this hand for this player compared to the other player's."
    end
end

end