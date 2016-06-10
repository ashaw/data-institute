require 'rest-client'
require 'nokogiri'
require 'pp'

#url   = "http://goo.gl/SVQsko"
url    = "http://localhost:8000/sources/tn-elections.html"
doc    = Nokogiri::HTML(RestClient.get(url))
clean  = {}

# each table is a county
doc.css("table").each do |table|
  cty_name = table.css("h3").text

  ary = table.css("tr").map do |row|
    row.css("td").map do |cell|
      cell.text
    end
  end

  ret = ary.reduce(Hash.new(0)) do |memo, it|
    memo[it[0]] = it[1]
    memo
  end

  clean[cty_name] = ret
end

pp clean