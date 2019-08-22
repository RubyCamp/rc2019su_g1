module Title
  class TitleManager
    def initialize
      @title_img = Image.load("images/back/castle.jpg")
      @girl1_img = Image.load("images/chara/girl/girl1.png")
      @boy4_img = Image.load("images/chara/boy/boy4.png")
      @titlepop_img = Image.load("images/back/titlepop.png")
      @y1 = 170
      @y2 = 140
      @p = 0.7

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
      x = Input.mouse_pos_x  # マウスカーソルのx座標
      y = Input.mouse_pos_y  # マウスカーソルのy座標
      p x
      Window.draw(0, 0, @title_img)
      Window.draw(0, -50, @titlepop_img)
      Window.draw(-40, @y1, @girl1_img)
      Window.draw_scale(570, @y2, @boy4_img,0.9,0.9)
      Window.draw_font(180,500,"Press enter to start",@@title_font,:color=>[255, 0, 255, 255])
      Window.draw_box(180,450,500,550,[255,255,255])
      @y1 -= @p
      @y2 -= @p
      if @y1 <= 130 || @y2 <= 100
        @p = @p * -1
      elsif @y1 >= 170 || @y2 >= 140
        @p = @p * -1
      end

    end
  end
end
