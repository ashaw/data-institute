require 'rest-client'
require 'nokogiri'
require 'pp'

url   = "http://goo.gl/SVQsko"
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

  cty = {}
  ary.each do |cells|
    # cells[0] is candidate name
    # cells[1] is votes
    cty[cells[0]] = cells[1].gsub(/[^\d]/,"").to_i
  end

  clean[cty_name] = cty
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