module Title
  class TitleManager
    def initialize

      # @bg_img = Image.load("images/background_ending.png")
      @timer = 3 * 60
    end

    def play
      puts "Title"
      Window.draw_font(0,0,"うんこ", @@font)
      @timer -= 1
      if @timer <= 0
        @timer = 3*60
        
        Scene.move_to(:game)
      end
    end
  end
end
