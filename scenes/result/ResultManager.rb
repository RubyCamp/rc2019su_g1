module Result
  class ResultManager
    def initialize

      # @bg_img = Image.load("images/background_ending.png")

    end

    def play
      Window.draw_font(0,0,"ああああ", @@font)

      if Input.keyPush?(K_S)
        Scene.move_to(:title)
      end
    end
  end
end
