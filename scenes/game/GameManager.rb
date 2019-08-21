module Game
  class GameManager
    def initialize

      # @bg_img = Image.load("images/background_ending.png")

    end

    def draw
      Window.draw_font(0,0,"ｓｓｓｓ", @@font)
    end

    def play

      draw
      if Input.keyPush?(K_A)
        Scene.move_to(:result)
      end
    end
  end
end
