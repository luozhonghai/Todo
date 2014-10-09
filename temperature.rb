require 'net/http'
LONG_MONTH = [1,3,5,7,8,10,12]
SHORT_MONTH = [4,6,9,11]

class TempRecord
  def initialize(in_time, in_max_temp, in_min_temp)
    @time = in_time
    @max_temp = in_max_temp
    @min_temp = in_min_temp
  end
  
  def show
    puts "#{@time} max:#{@max_temp} min:#{@min_temp}"
  end

  attr_reader :max_temp, :min_temp
end

def get_max_and_min_degree(html_code)
  html_code =~ /#ff3300"? *>([-\d.]+).*</
  max_degree = $1.to_f
  html_code =~ /#0066ff"? *>([-\d.]+).*</
  min_degree = $1.to_f

  return max_degree, min_degree
end

def show_temp(in_month)
  record_array = []
  month = in_month
  if LONG_MONTH.include?(month)
    cycle = 31
  elsif SHORT_MONTH.include?(month)
    cycle = 30
  elsif month == 2
    cycle = 28
  else
    puts "指定された月の平均気温は取得出来ません"
    return
  end
  
  day = 0
  cycle.times do
    day += 1
    url = "/weather/jp/past/13/4410/detail.html?c=2014&m=#{month}&d=#{day}"
	  html_code = Net::HTTP.get('weather.yahoo.co.jp', url)
    degrees = get_max_and_min_degree(html_code)
    record = TempRecord.new("2014/#{month}/#{day}", degrees[0], degrees[1])
    record.show
    record_array.push(record)
  end
  
  avg_max = 0
  avg_min = 0
  record_array.each do
    |v| 
    avg_max += v.max_temp
    avg_min += v.min_temp
  end
  avg_max = avg_max / record_array.length
  avg_min = avg_min / record_array.length

  puts
  printf("%d月の平均最高気温 = %.1f\n", month, avg_max)
  printf("%d月の平均最低気温 = %.1f\n", month, avg_min)
end


query_month = ARGF.argv[0].to_i
show_temp(query_month)

