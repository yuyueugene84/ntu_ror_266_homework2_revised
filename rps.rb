require_relative "player.rb"

class RPS
  # 剪刀石頭布這三種選項不會改變，應定義成 CONSTANT，之後在打印出結果時，可以很容易的把
  # R/P/S 轉成 Rock / Paper / Scissors
  HANDS = {
            R: "Rock",
            P: "Paper",
            S: "Scissors"
          }

  attr_accessor :human_player, :computer_player, :msg

  def initialize
    # RPS 被 new 出來時就會 new 出兩個玩家
    @human_player = HumanPlayer.new(get_user_name)
    @computer_player = ComputerPlayer.new("Matrix")
    play
  end

  # 用一個 method 去呼叫所有的物件和方法
  def play
    intro  
    begin 
      human_player.pick_hand
      computer_player.pick_hand
      msg = check_win(human_player.hand, computer_player.hand)
      print_result(self.human_player.hand, self.computer_player.hand, msg)
    end while continue? == "Y"
    goodbye
  end

  private 

    def get_user_name
      puts "Please enter your name:"
      gets.chomp.capitalize!
    end

    def continue?
      begin
        puts "Play Again?: Y / N"
        continue = gets.chomp.upcase
      end while !["Y", "N"].include?(continue)
      continue # 利用 method 會回傳最後一行程式碼執行的結果，
               # 確保 continue 的值有被回傳
    end

    def intro
      # 我們在知道玩家的名字後就可把玩家的名字印出
      puts "|===============================================|" 
      puts "   #{human_player.name}! Welcome to Rock Paper Scissors!!!"
      puts "|===============================================|"
    end

    def goodbye
      puts "|===============================================|"
      puts "|       Good Bye! Thanks for playing!           |"
      puts "|        OOP Rock Paper Scissors!!!             |"
      puts "|           by Eugene Chang 2015                |"
      puts "|===============================================|"
    end

    # 把玩家、電腦的名字、和訊息印出
    def print_result(user_input, computer_input, message)
      puts "#{human_player.name} choose #{HANDS[user_input.to_sym]}, computer chooses #{HANDS[computer_input.to_sym]}, #{human_player.name} #{message}!"
      puts "================================================="
    end

    # 判斷誰贏誰輸，回傳訊息
    def check_win(user_input, computer_input)
      if (user_input == computer_input)
        ",it's a draw"
      elsif user_input == "R"
        if computer_input == "S"
          "wins"
        elsif computer_input == "P"
          "loses"
        end
      elsif user_input == "P"
        if computer_input == "R"
          "wins"
        elsif computer_input == "S"
          "loses"
        end
      elsif user_input == "S"
        if computer_input == "P"
          "wins"
        elsif computer_input == "R"
          "loses"
        end
      end
    end
end
