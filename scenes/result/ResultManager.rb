module Result
  class ResultManager
    def initialize

      # @bg_img = Image.load("images/background_ending.png")

    end

    def play
      Window.draw_font(0,0,"ああああ", @@font)

<<<<<<< HEAD
      if Input.keyPush?(K_S)
=======
      @timer -= 1
      if @timer <= 0
        @timer = 3*60
>>>>>>> 44b59aa9afa36099cecad9a81ed65fb2befd412b
        Scene.move_to(:title)
      end
    end
  end
end
