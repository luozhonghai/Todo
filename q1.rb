#!/usr/bin/env ruby

n = 0
def rand_hand(i)
	if i == 0
		return "グー"
	elsif i == 1
		return "チョキ"
	else 
		return "パー"
	end
end

for n in 1..10
    k = rand(3)
    puts rand_hand(k)
end