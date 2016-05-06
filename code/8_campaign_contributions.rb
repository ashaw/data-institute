require 'restclient'
require 'json'

KEY = "qQ6CXg1UQg1xJ7gNXvXZW9qeE99QNAOY2Sn3TKw2"

# bernie, hillary, trump
# look up IDs here: http://fec.gov/finance/disclosure/efile_search.shtml
committees = ["C00577130", "C00575795", "C00580100"]
out = "committee_id,total_contributions,total_disbursements\n"

def url(committee_id)
  "https://api.propublica.org/campaign-finance/v1/2016/committees/#{committee_id}.json"
end

committees.each do |c|
  resp = RestClient.get(url(c), {"X-API-Key" => KEY})
  data = JSON.parse(resp)
  contributions = data['results'][0]['total_contributions']
  disbursements = data['results'][0]['total_disbursements']
  out << "#{c},#{contributions},#{disbursements}\n"
end

File.open("campfin.csv", "w") do |f|
  f.write out
end
