require 'rest-client'
require 'nokogiri'
require 'pp'

url   = "http://goo.gl/SVQsko"
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

  cty = {}
  ary.each do |cells|
    # cells[0] is candidate name
    # cells[1] is votes
    cty[cells[0]] = cells[1]
  end

  clean[cty_name] = cty
end

pp clean