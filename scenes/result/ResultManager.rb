module Result
  class ResultManager
    def initialize
      @back_ground=Image.load("images/result/background.jpg")
      @question = Image.load("images/result/question3.png")
      @a_img=Image.load("images/chara/girl/girl6.png")
      @b_img=Image.load("images/chara/girl/girl1.png")
      @c_img=Image.load("images/chara/girl/girl4.png")
      @d_img=Image.load("images/chara/girl/girl5.png")
      @hart_img=Image.load("images/result/hart.png")
      @result_sound=Sound.new("sounds/BGM/trueED.wav")
      @result_sound.loop_count = (-1)
      @result_soundplaying=false
      #初期化しないといけないかもしれない変数
      @start_time = Scene.get_val(:start_time)

    end

    def set_end_time
      @time= Scene.set_val(:end_time, Time.now) - @start_time
    end

    def get_score(s,f)
      @failed  = Scene.set_val(:failed,f)
      @success  = Scene.set_val(:success,s)
    end

    def failed_score
      if @failed < 10
        @failed_point = 20
      elsif @failed < 20
        @failed_point = 15
      elsif @failed < 30
        @failed_point = 10
      else
        @failed_point = 5
      end
    end

    def time_score
      @time.to_i
      if @time < 50       #Aランクの時２０ポイント
        @time_point = 20
      elsif @time < 60
        @time_point = 15
      elsif @time < 70
        @time_point = 10
      else
        @time_point = 5
      end
    end

    def rank_score      #ポイントの合計
      failed_score
      time_score
      @rank = @failed_point + @time_point
    end


    def play
      #x = Input.mouse_pos_x  # マウスカーソルのx座標
      #y = Input.mouse_pos_y  # マウスカーソルのy座標
      #p x
      if @result_soundplaying == false
          @result_sound.play
          @result_soundplaying = true
      end
      if Input.keyPush?(K_RETURN)
        @result_sound.stop
        Scene.move_to(:title)
      end
    end

    def draw
      Window.draw(0,0,@back_ground)
      Window.draw_scale(-50,-50,@hart_img,0.7,0.7)
      Window.draw_scale(30,20,@question,0.5,0.9)
      Window.draw_box_fill(370,290,850,620,[200,200,200])
      Window.draw_line(370,400,850,400,[0,0,0])
      Window.draw_line(370,510,850,510,[0,0,0])
      Window.draw_line(370,620,850,620,[0,0,0])
      score_point


      rank_score
      if @rank <= 15      #@rankポイントの数値が多ければAに近くなる
        Window.draw(-20,170,@d_img)
        @rank_alpha = "D"
      elsif @rank <= 25
        Window.draw(-20,170,@c_img)
        @rank_alpha = "C"
      elsif @rank <= 35
        Window.draw(-20,170,@b_img)
        @rank_alpha = "B"
      else
        Window.draw(-20,170,@a_img)
        Window.draw_font(330,50,"やりますなぁ！！！根性ありますやん！！！！",@@font,:color=>[0,0,0])
        @rank_alpha = "A"
      end


    end

    def score_point
        Window.draw_font(380,315,"スコア",@@title_font,:color=>[0,0,0])
        Window.draw_font(720,315,"#{@success}",@@title_font,:color=>[0,0,0])
        Window.draw_font(380,425,"入力時間",@@title_font,:color=>[0,0,0])
        Window.draw_font(720,425,"#{@time.to_i}秒",@@title_font,:color=>[0,0,0])
        Window.draw_font(380,530,"間違えた数",@@title_font,:color=>[0,0,0])
        Window.draw_font(720,530,"#{@failed}",@@title_font,:color=>[0,0,0])
        Window.draw_font(115,65,"#{@rank_alpha}",@@rank_font,:color=>[0,0,0])
    end
  end

end

# 2週目のtitle画面でボタンを押した瞬間におちる
