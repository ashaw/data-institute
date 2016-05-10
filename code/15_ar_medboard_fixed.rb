require 'nokogiri'
require 'restclient'

doc = Nokogiri::HTML(RestClient.get("https://goo.gl/evoIpq"))
table = doc.css("#ctl00_ctl00_MainContentPlaceHolder_innercontent_gvLicNotices")
out = ""
out << '"' + table.css("th").map(&:text).join('","') + '"' + "\n"
table.css("tr")[1..-1].each do |row|
  out << '"' + row.css("td").map(&:text).join('","') + '"' + "\n"
end
File.open("ar_medboard.csv", "w") {|f| f.write out }