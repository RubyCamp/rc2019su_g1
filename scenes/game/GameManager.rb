require 'dxruby'
require 'csv'
Encoding.default_external = "utf-8"
# coding: shift_jis


module Game
  class GameManager
    def initialize

      # CSV読み込み
      @@keys = []
      CSV.foreach("lovetype.csv") do |row|
        @@keys << row
      end

      @j = 0
      @i = 0
      @se_sound=Sound.new("sounds/SE/typewriter.wav")
      @se_sound.start = (100000)
      @textarray=[]

      # ↓ResultManagerで使えるようにしないといけない
      @failed = 0
      @success = 0

      # @@failedとの差分をとるための変数
      @subfailed = 0

      # 一問に何回間違えたかを格納する変数
      @failed_condition = 0

      @pointflag = true

      @good_voice = [Sound.new("sounds/SE/good.wav"),
                     Sound.new("sounds/SE/success.wav"),
                     Sound.new("sounds/SE/marvelous.wav"),
                     Sound.new("sounds/SE/pinpon.wav")]
      @bad_voice = Sound.new("sounds/SE/bad.wav")


      Scene.set_val(:start_time, Time.now)
      @girl = [Image.load("images/chara/girl/girl6.png"),
               Image.load("images/chara/girl/girl1.png"),
               Image.load("images/chara/girl/girl2.png"),
               Image.load("images/chara/girl/girl3.png"),
               Image.load("images/chara/girl/girl4.png"),
               Image.load("images/chara/girl/girl5.png"),
               Image.load("images/chara/girl/girl8.png"),
               Image.load("images/chara/girl/girl7.png"),]

      @bgimg = []
      for i in 1..@@keys.length do
        @bgimg << Image.load("images/question/Q#{i}.png")
      end

      @fukidasi1 = Image.load("images/game/fukidasi1.png")
      @fukidasi2 = Image.load("images/game/fukidasi2.png")

      @anser_font = Font.new(60)

      @answer_word = ""

        # 質問のエフェクトてすと
      @question_word = ""
      @questionflag = true
      @questionpos = 0

      @game_sound=Sound.new("sounds/BGM/stage1.wav")
      @game_sound.loop_count = (-1)
      @game_soundplaying=false
    end

    def play
      if @game_soundplaying == false
        @game_sound.play
        @game_soundplaying = true
      end

      if @@keys.length > @j

        @textarray = @@keys[@j][2].split("")
        @textLength = @textarray.length
        key = Object.const_get("K_"+@textarray[@i].upcase)

        keys = Input.keys
        if keys.include?(key)
          @se_sound.play
          # 成功時の処理
          @answer_word += @textarray[@i]
          @i += 1
          @success += 1
        end

        Window.draw_font(350,450,"#{@answer_word}",@anser_font,:color=>[255, 255, 0, 0])



          if @pointflag
            if keys.length > 0
              if keys.include?(key) == false
                @se_sound.play
                # タイプ失敗時の処理
                @failed += 1

                @failed_condition += 1
              end
            end
            @pointflag = false
          end

          if keys.empty?
            # 押しているキーの配列が空になったらフラグを切り替える
            @pointflag = true
          end

        if @textLength-1 < @i
          @i=0
          @j+=1
          @answer_word = ""

          # 間違った回数の差分をとって5回以上だと怒られる
          if(@failed - @subfailed > 5)
            @bad_voice.play
          else
            @good_voice[rand(4.0)].play
          end
          @subfailed = @failed

          @failed_condition = 0

          @questionflag = true
          @question_word = ""
        end
      end

      #if @j > @@keys.length-1
      if Input.keyPush?(K_W)
        @game_sound.stop
        Scene.scenes[:result].get_score(@success,@failed)
        Scene.scenes[:result].set_end_time
        Scene.move_to(:result)

      end

    end






    def draw
      # ↓めちゃくちゃわかりづらい
      Window.draw(0,0,@bgimg[@@keys[@j][3].to_i - 1])
      Window.draw_box_fill(0,50,800,100,[255, 5, 25, 26])
      # Window.draw_font_ex(20,50,"#{@@keys[@j][0]}",@@font)

      if(@failed_condition <= 7)
        Window.draw(-50,100,@girl[@failed_condition])
      else
        Window.draw(-50,100,@girl[7])
      end



      # ↓この塊自体はいらなかったら消していい
      if @question_word.empty?
        @start_time = Time.now
      end
      if @questionflag
        question_array = @@keys[@j][0].split("")
        #p [:time, Time.now, @start_time, @question_word.size]
        if Time.now > @start_time + 0.1 * @question_word.size
          @question_word << question_array[@question_word.size]
        end
        draw_eventually()
        # p @question_word.class
        # p @@keys[@j][2].class
        #sleep(0.1)
        #p [:all, question_array]
        if question_array.length <= @question_word.size
          @questionflag = false
        end
      else
        @question_word = @@keys[@j][0]
        draw_eventually()
      end

      Window.draw_scale(120,130,@fukidasi2,0.6,0.8)
      Window.draw_font(350,350,"#{@@keys[@j][2]}",@anser_font,:color=>[255, 0, 0, 0])
      Window.draw_font(350,250,"#{@@keys[@j][1]}",@anser_font,:color=>[255, 0, 0, 0])



      # Window.draw_font(0,80,"#{@textarray[@i]}",@@font)
      # 押しているキーの配列の描画
      # 消してOK
      # Window.draw_font(0,150,"#{Input.keys}",@@font)
      # 間違った回数の描画
      # 消してOK
      Window.draw_font(0,180,"#{@failed}",@@font)


    end

    def draw_eventually
      #p [:current,@question_word]
      #p Window.fps
      # 適当な数だから
      Window.draw_scale(-170,-20,@fukidasi1,0.7,0.5)
      Window.draw_font(50,50,"#{@question_word[0,26]}\n#{@question_word[26,26]}",@@font,:color=>[255, 0, 0, 0])
    end


  end
end


# ２週目からばぐる
