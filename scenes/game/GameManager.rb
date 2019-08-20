module Game
  class GameManager
    def initialize
      # @bg_img = Image.load("images/background_ending.png")
      @timer = 3 * 60
    end

    def play
      puts "Game"
      Window.draw_font(0,0,"ｓｓｓｓ", @@font)

      @timer -= 1
      if @timer <= 0
        Scene.move_to(:result)
      end
    end
  end
end
