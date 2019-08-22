module Levels
  class LevelsManager
    def initialize

      @level_img = Image.load("images/background.jpg")

      @FONT_SIZE = 64

      # @limit_time = 4 # 分*60
      # @start_time = Time.now

    end

    def play

      Window.draw_scale(-50,0, @level_img,1,1.05)
      x = Input.mouse_pos_x  # マウスカーソルのx座標
      y = Input.mouse_pos_y  # マウスカーソルのy座標

      Window.draw_box(350, 165, 150, 115, [0,0,0])
      Window.draw_box(350, 290, 150, 240, [0,0,0])
      Window.draw_box(350, 415, 150, 365, [0,0,0])

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
        # Window.loop do

        #   now_time = Time.now

        #   diff_time = now_time - start_time

        #   countdown = (limit_time - diff_time).to_i

        #   min = countdown / 60

        #   sec = countdown % 60

        #   Window.drawFont(100, 100, "#{sec}", @FONT_SIZE)

        #   if sec == 0 then
        #     break
        #   end

        # end
        Scene.move_to(:game)
      end
      if (x>=150&&x<=350)&&(y>=240&&y<=290)&&Input.mouse_push?(M_LBUTTON)
        Scene.move_to(:game)
      end
      if (x>=150&&x<=350)&&(y>=365&&y<=415)&&Input.mouse_push?(M_LBUTTON)
        Scene.move_to(:game)
      end
    end

    def word_mouse_over?(word, draw_x, draw_y)
      Input.mouse_x.between?(draw_x, draw_x + (word.length * @FONT_SIZE)) &&
        Input.mouse_y.between?(draw_y, draw_y + @FONT_SIZE)
    end



    def draw
     # Window.draw_box(350, 165, 150, 115, [255,255,255])
     # Window.draw_box(350, 290, 150, 240, [255,255,255])
     # Window.draw_box(350, 415, 150, 365, [255,255,255])
     # Window.draw_font(200,125,"EASY", @@font)
     # Window.draw_font(200,250,"NORMAL", @@font)
     # Window.draw_font(200,375,"HARD", @@font)
    end

  end
end
