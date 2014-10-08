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

def result(a,b)
	if( a == 1 && b == 2 || a == 2 && b == 0 || a == 0 && b == 1)
		return 1
	elsif (a == b)
		return 2
	else
        return 3
    end
end

for n in 1..10
	a = rand(3)
	b = rand(3)
	res = result(a,b)
	puts "Aさん: " + rand_hand(a)
	puts "Bさん: " + rand_hand(b)
	if res == 1
		puts "  勝敗　=  Aさんの勝ち"
	elsif res == 3
		puts "  勝敗　=  Bさんの勝ち"
    else  res == 2
       puts "  引き分け"
	end
end