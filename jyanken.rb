STAT = ["グー","チョキ","パー"]
JUDGE_RES = ["勝ち","負け","引き分け"]

class Jyankenb
	def poi
	  @myhand = rand(3)
	end

	def hand
	  @myhand
	end

	def to_s
		"#{STAT[@myhand]}"
	end

	def judge(b)
		if @myhand == 0 && b.hand == 1 ||
		   @myhand == 1 && b.hand == 2 ||
		   @myhand == 2 && b.hand == 0 
		  return "#{JUDGE_RES[0]}"
		elsif @myhand == hand
		  return "#{JUDGE_RES[2]}"	
		else
		  return "#{JUDGE_RES[1]}"					
		end
	end

	@myhand
end

a = Jyanken.new
b = Jyanken.new

10.times do |n|
  a.poi
  b.poi
  puts "#{n + 1}回戦"
  puts "  Aさん：#{a}  Bさん： #{b}" 
  puts "  勝負 = Aさんの" + a.judge(b)
end