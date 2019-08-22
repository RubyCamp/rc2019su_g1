module Title
  class TitleManager
    def initialize
      @title_img = Image.load("images/castle-1030461_1280.jpg")
      @title_sound=Sound.new("sounds/BGM/title.wav")
      @title_sound.loop_count = (-1)
      @title_soundplaying=false
    end

    def play
      if @title_soundplaying == false
          @title_sound.play
          @title_soundplaying = true
      end

      if Input.keyPush?(K_RETURN)
        @title_sound.stop
        Scene.move_to(:levels)
      end
    end

    def draw
      Window.draw(0, 0, @title_img)
      Window.draw_font(200,300,"Please Push ENTER", @@title_font)
    end
  end
end
