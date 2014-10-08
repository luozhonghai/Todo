
class Person
	def initialize(name,height,weight)
		@name = name
		@height = height
		@weight = weight
	end

	def bmi
		weight / (height * height * 0.0001)
	end
	
	def judge
		if bmi > 30
			"高度肥満"
		elsif bmi <= 30 && bmi > 25
			"肥満"
		elsif bmi <= 25 && bmi > 18.5 
			"標準"
		elsif bmi <= 18.5
			"やせ"								
		end
	end
	attr_accessor :height, :weight
	attr_reader :name
	
end