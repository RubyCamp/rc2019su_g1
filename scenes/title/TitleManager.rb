module Title
  class TitleManager
    def initialize
      #タイトル画面素材
      @title_img = Image.load("images/back/castle.jpg")
      @girl1_img = Image.load("images/chara/girl/girl1.png")
      @boy4_img = Image.load("images/chara/boy/boy4.png")
      @titlepop_img = Image.load("images/back/titlepop.png")
      @heart_img = Image.load("images/back/heart.png")
      @square_img = Image.new(550,75,[225,220,175])
      #プロローグ画面素材
      @p_back = Image.load("images/question/Q7.png")
      @boy2_img =Image.load("images/chara/boy/boy2.png")
      @text_box = Image.new(900,500,[0,0,0])
      @sentence = ["僕の名前は「大阪 のぼる」","ネットで知り合った島根の女性「神在 つきの」さんと\nデートをすることになった。",
        "島根の魅力をたくさんtypingしてデートを盛り上げよう！！"," "]
      @S = 0

      #動かすための奴
      @y1 = 170
      @y2 = 140
      @p = 0.7
      #サウンド
      @title_sound=Sound.new("sounds/BGM/title.wav")
      @title_sound.loop_count = (-1)
      @title_soundplaying=false
      @title_flag = false
    end

    def play
      x = Input.mouse_pos_x  # マウスカーソルのx座標
      y = Input.mouse_pos_y  # マウスカーソルのy座標
      # p x
      # p y
      if @title_soundplaying == false
        @title_sound.play
        @title_soundplaying = true
      end
      if Input.keyPush?(K_RETURN)
        if @title_flag == true
           @S += 1
         end
         @title_flag = true
      end
      if @S == 3 && Input.key_down?(K_RETURN)
        Scene.move_to(:levels)
      end

      # if (x>=175&&x<=725)&&(y>=500&&y<=575)&&Input.mouse_push?(M_LBUTTON)
      #   prologue()
      # end
    end

    def draw
      if @title_flag == false       #titleの方のdraw
        Window.draw(0, 0, @title_img)
        Window.draw(0, -50, @titlepop_img)
        Window.draw(-40, @y1, @girl1_img)
        Window.draw_scale(570, @y2, @boy4_img,0.9,0.9)
        Window.draw(165,500, @square_img)
        Window.draw_font(280,500,"Press to start",@@title_font,:color=>[255, 0, 255, 255])
      else                          #プロローグ画面のdraw
        Window.draw(0,0,@p_back)
        Window.draw_scale(570,120,@boy2_img,0.9,0.9)
        Window.draw_alpha(0,450,@text_box,180)
        Window.draw_font(25,480,@sentence[@S].to_s,@@font)
      end
      #@girl1_imgと@boy4_imgの動き
      @y1 -= @p
      @y2 -= @p
      if @y1 <= 130 || @y2 <= 100
        @p = @p * -1
      elsif @y1 >= 170 || @y2 >= 140
        @p = @p * -1
      end

      #プロローグ画面処理

    end
  end
end
