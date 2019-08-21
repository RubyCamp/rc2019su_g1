module Title
  class TitleManager
    def initialize
<<<<<<< Updated upstream
      @title_img = Image.load("images/back/castle.jpg")
      @girl1_img = Image.load("images/chara/girl/girl1.png")
      @boy4_img = Image.load("images/chara/boy/boy4.png")
      @titlepop_img = Image.load("images/back/titlepop.png")

    end

    def play
      x = Input.mouse_pos_x  # マウスカーソルのx座標
      y = Input.mouse_pos_y  # マウスカーソルのy座標
      p y
      Window.draw(0, 0, @title_img)
      Window.draw_box(350, 165, 150, 115, [255,255,255])
      Window.draw(0, -50, @titlepop_img)
      Window.draw(-40, 120, @girl1_img)
      Window.draw_scale(570, 100, @boy4_img,0.9,0.9)
      Window.draw_font(350,400," Push \n   to\n start", @@title_font)
=======
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
>>>>>>> Stashed changes
      if Input.keyPush?(K_RETURN)
        Scene.move_to(:levels)
      end
    end
  end
end
