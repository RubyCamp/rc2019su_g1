module Result
  class ResultManager
    def initialize

      # @bg_img = Image.load("images/background_ending.png")

    end

    def play
      if Input.keyPush?(K_S)
        Scene.move_to(:title)
      end
    end

    def draw
      Window.draw_font(0,0,"ああああ", @@font)
    end

  end

end
