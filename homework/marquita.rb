class Vote
  def initialize(name)
    @name = name
  end

    @@board = {
      "Duncan"  => "yes",
      "Quick"   => "yes",
      "Price"   => "yes",
      "Belton"  => "no",
      "Alexander"   => "no",
      "McCullough"  => "yes",
      "Garrett"   => "yes",
      "Hayes-Greene"   => "yes",
      "Belton" => "no",
      "Alexander"   => "no",
      "Buffington"   => "yes",
      "Routh"  => "yes",
    }
    # @@board["Duncan"]

    def board_votes
        puts "School board member #{@name} voted this way: #{@@board[@name]}"
    end
end