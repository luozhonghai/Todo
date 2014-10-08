$stat = ["グー","チョキ","パー"]
$a = [0,0,0]
$people = [0,0,0,0,0]
$left = 5
$win = 0
def new_round
  for n in 0..3
    $a[n] = 0
  end
  for n in 0..4
    if ($people[n] == -1)
  	  print "#{n+1}: x "
  	  next
    end
    i = rand(3)
    $a[i] += 1
    $people[n] = i
    print "#{n+1}: #{$stat[i]} "
  end
  print "\n"
end

def fail(id)
  puts "  勝ち: #{$stat[id-1]}"
	for n in 0..4
		if $people[n] == id
			$people[n] = -1
			$left -= 1
    elsif $people[n] > -1
      $win = n + 1
		end
	end
end

def judge
  if $a[0] > 0 && $a[1] > 0 && $a[2] == 0
  	fail(1)
  elsif $a[1] > 0 && $a[2] > 0 && $a[0] == 0
  	fail(2)
  elsif $a[2] > 0 && $a[0] > 0 && $a[1] == 0
  	fail(0)
  else
  	puts "  引き分け"
  end
end


while 1
  if $left == 1
  	puts "\n勝者: #{$win}"
  	break
  end
  new_round
  judge
end
