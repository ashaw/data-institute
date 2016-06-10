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

  ary = table.css("tbody").css("tr").map do |row|
    row.css("td").map do |cell|
      cell.text
    end
  end

  ret = ary.reduce(Hash.new(0)) do |memo, it|
    memo[it[0]] = it[1].gsub(/[^\d]/,"").to_i
    memo
  end

  clean[cty_name] = ret
end

# first line is the candidates row
# let's assume all candidates are on the
# ballot in all counties and grab them 
# from the first county
# make sure to leave a field for the 
# county column
csv = "county," + clean.values[0].keys.sort.join(",") + "\n"

# iterate through the counties and add to the sheet
clean.each do |name, cands|
  row = "#{name},"

  # iterate through the cands by key
  # in order to keep them in alpha order
  cands.keys.sort.each_with_index do |key, idx|
    row << cands[key].to_s
    if idx < cands.keys.length - 1
      row << ","
    end
  end
  row << "\n"
  csv << row
end

File.open("tn_results.csv", "w") do |f|
  f.write csv
end