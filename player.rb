class Player
  attr_accessor :hand
  # attr_reader 是權限只有讀沒有寫，所以 ruby 只會為 @name 產生 getter method
  attr_reader :name

  # 玩家不管是電腦還是人類都應該有名字和選項
  def initialize(name)
    @name = name
    @hand = nil
  end

  def pick_hand
    begin 
      puts "please choose one of the following: R / P / S"
      user_input = gets.chomp.upcase
    end while !["R", "P", "S"].include?(user_input) 
    self.hand = user_input
  end
end

class HumanPlayer < Player
end

class ComputerPlayer < Player
  # 電腦是自動計算選項，應 override Player Class 的 pick_hand
  def pick_hand
    self.hand = ["R","P","S"].sample
  end
end
