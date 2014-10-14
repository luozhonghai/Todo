require 'net/http'
LONG_MONTH = [1,3,5,7,8,10,12]
SHORT_MONTH = [4,6,9,11]

class TemperatureRecord
  def initialize(date, max, min)
    @time = date
    @max = max
    @min = min
  end
  
  def show
    puts "#{@date} max:#{@max} min:#{@min}"
  end

  attr_reader :max, :min
end

def get_max_and_min_degree(html_code)
  html_code =~ /#ff3300"? *>([-\d.]+).*</
  max_degree = $1.to_f
  html_code =~ /#0066ff"? *>([-\d.]+).*</
  min_degree = $1.to_f

  return max_degree, min_degree
end

def show_temperature(month)
  records = []
  month = month
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
    url = URI("http://weather.yahoo.co.jp/weather/jp/past/13/4410/detail.html?c=2014&m=#{month}&d=#{day}")
    res = Net::HTTP.get_response(url)
    if res.message != 'OK' && day == 1
      puts "指定された月の平均気温は取得出来ません"
      return
    elsif  res.message != 'OK' && day > 1
      next
    end
    html_code = Net::HTTP.get(url)
    degrees = get_max_and_min_degree(html_code)
    record = TemperatureRecord.new("2014/#{month}/#{day}", degrees[0], degrees[1])
    record.show
    records.push(record)
  end
  
  sum_max = 0
  sum_min = 0
  records.each do
    |v| 
    sum_max += v.max
    sum_min += v.min
  end
  avg_max = sum_max / records.length
  avg_min = sum_min / records.length

  puts
  printf("%d月の平均最高気温 = %.1f\n", month, avg_max)
  printf("%d月の平均最低気温 = %.1f\n", month, avg_min)
end


query_month = ARGF.argv[0].to_i
show_temperature(query_month)

