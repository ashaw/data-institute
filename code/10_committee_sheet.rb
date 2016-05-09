require 'restclient'
require 'json'

KEY = "qQ6CXg1UQg1xJ7gNXvXZW9qeE99QNAOY2Sn3TKw2"

class CommitteeSheet
  def initialize(committees)
    # array like ["C00577130", "C00575795", "C00580100"]
    @committees = committees
    @out = "committee_id,total_contributions,total_disbursements\n"
  end

  def url(committee_id)
    "https://api.propublica.org/campaign-finance/v1/2016/committees/#{committee_id}.json"
  end

  def build
    @committees.each do |c|
      resp = RestClient.get(url(c), {"X-API-Key" => KEY})
      data = JSON.parse(resp)
      contributions = data['results'][0]['total_contributions']
      disbursements = data['results'][0]['total_disbursements']
      @out << "#{c},#{contributions},#{disbursements}\n"
    end
  end

  def write
    File.open("committees.csv", "w") do |f|
      f.write @out
    end
  end
end

if __FILE__ == $0
  cs = CommitteeSheet.new(["C00577130", "C00575795", "C00580100"])
  cs.build
  cs.write
end
