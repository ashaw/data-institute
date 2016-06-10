class Bandname
  def initialize()
  end

  @@oldtestament = [
    "Ezekiel",
    "Ruth",
    "David",
    "Zebediah",
    "Miriam"
  ]

  @@shakespeare = [
    "barefaced",
    "swagger",
    "moonbeam",
    "addiction",
    "scuffle",
  ]

  def assign_oldtestament
    "#{@@oldtestament.shuffle[0]} #{@@oldtestament.shuffle[1]}"
  end
end


