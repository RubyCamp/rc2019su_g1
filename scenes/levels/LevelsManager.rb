module Levels
  class LevelsManager
    def initialize
      @level_img = Image.load("images/background.jpg")
      @count_sound = Sound.new("sounds/SE/countdown.wav")
      @start_sound = Sound.new("sounds/SE/start.wav")


      @FONT_SIZE = 64
      @limit_time = 5
      @box_img = Image.new(425,300,[255,0,25])
    end

    def play
      x = Input.mouse_pos_x  # マウスカーソルのx座標
      y = Input.mouse_pos_y  # マウスカーソルのy座標
      @words = ["EASY" , "NORMAL" , "HARD"]

      draw_y = 0
      @words.each_with_index do |word|
        draw_x = 200
        draw_y += 125
        color_val = [0,0,0]

        case draw_y
         when 125 then
          color_val = [0, 255, 0]
         when 250 then
          color_val  = [250, 223, 0]
         when 375 then
          color_val = [255, 0, 0]
        end
        color = word_mouse_over?(word, draw_x,draw_y) ? color_val : [0, 0, 0]
        Window.draw_font(draw_x, draw_y, word, @@font, color: color)

      end
      # puts x
      # いったん消します
      if (x>=150&&x<=350)&&(y>=115&&y<=165)&&Input.mouse_push?(M_LBUTTON)
        
        countDown()

        count_sound_stop()
        Scene.set_val(:start_time, Time.now)
        Scene.move_to(:game)
      end

      if (x>=150&&x<=350)&&(y>=240&&y<=290)&&Input.mouse_push?(M_LBUTTON)
        countDown()

        count_sound_stop()
        Scene.set_val(:start_time, Time.now)
        Scene.move_to(:game)
      end

      if (x>=150&&x<=350)&&(y>=365&&y<=415)&&Input.mouse_push?(M_LBUTTON)
        countDown()
        count_sound_stop()
        Scene.set_val(:start_time, Time.now)
        Scene.move_to(:game)
      end

    end

    def countDown
        @start_time = Time.now
        @font_size = Font.new(250)
        count_sound_play()
        Window.loop do         
          now_time = Time.now        
          diff_time = now_time - @start_time        
          countdown = (@limit_time - diff_time).to_i       
          sec = countdown % 60
          if sec == 1 then
            count_sound_stop()
            Window.draw_font(200,150,"start",@font_size)
            start_sound_play()
            

          elsif sec == 0 then
            start_sound_stop()
            break
          else
            Window.draw_rot(184,150,@box_img,45)
            Window.draw_rot(272,150,@box_img,315)
            Window.draw_font(380, 150, "#{sec-1}", @font_size)
          end

        end

    end

    def word_mouse_over?(word, draw_x, draw_y)
      Input.mouse_x.between?(draw_x, draw_x + (word.length * @FONT_SIZE)) &&
        Input.mouse_y.between?(draw_y, draw_y + @FONT_SIZE)
    end

    def count_sound_play      
      @count_sound.play
    end

    def count_sound_stop
      @count_sound.stop
    end

    def start_sound_play
      if @on_start.nil?
        @start_sound.play
        @on_start = true
      end
    end

    def start_sound_stop
      @start_sound.stop
    end

    def draw
      Window.draw_scale(-50,0, @level_img,1,1.05)
      Window.draw_box(350, 165, 150, 115, [0,0,0])
      Window.draw_box(350, 290, 150, 240, [0,0,0])
      Window.draw_box(350, 415, 150, 365, [0,0,0])
    end

  end
end
