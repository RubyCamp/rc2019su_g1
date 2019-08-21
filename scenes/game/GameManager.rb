module Game
  class GameManager 
    def initialize
<<<<<<< Updated upstream
=======
      @j = 0
      @i = 0
      @textarray=[]
      @typesound=Sound.new("sounds/SE/typewriter.wav")
    end

    def play

      #Window.draw_font(200,300,"Please Push ENTER", @@font)
>>>>>>> Stashed changes

      # @bg_img = Image.load("images/background_ending.png")

<<<<<<< Updated upstream
    end
=======
        key = Object.const_get("K_"+@textarray[@i].upcase)
        if Input.keyPush?(key)
          @typesound.play
          puts "sucsess!!!!!!!!!!"
          @i += 1
        end
>>>>>>> Stashed changes

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
