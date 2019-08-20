module Result
  class ResultManager
    def initialize

      # @bg_img = Image.load("images/background_ending.png")
      @timer = 3 * 60
    end

    def play
      puts "Result"
      Window.draw_font(0,0,"ああああ", @@font)

      @timer -= 1
      if @timer <= 0
        @timer = 3*60
        Scene.move_to(:title)
      end
    end
  end
end
