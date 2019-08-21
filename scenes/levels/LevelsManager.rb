module Levels
  class LevelsManager
    def initialize
      @izumo_img = Image.load("images/question/Q4.png")
      #@title_img = Image.load("images/castle-1030461_1280.jpg")


    end

    def play
      #Window.draw(0, 0, @title_img)
      x = Input.mouse_pos_x  # マウスカーソルのx座標
      y = Input.mouse_pos_y  # マウスカーソルのy座標
      Window.draw_scale(-450, -325, @izumo_img ,0.8,0.8)
      Window.draw_box(350, 165, 150, 115, [255,255,255])
      Window.draw_box(350, 290, 150, 240, [255,255,255])
      Window.draw_box(350, 415, 150, 365, [255,255,255])
      Window.draw_font(200,125,"EASY", @@font)
      Window.draw_font(200,250,"NORMAL", @@font)
      Window.draw_font(200,375,"HARD", @@font)
      puts x
      if (x>=150&&x<=350)&&(y>=115&&y<=165)&&Input.mouse_push?(M_LBUTTON)
        Scene.move_to(:game)
      end
      if (x>=150&&x<=350)&&(y>=240&&y<=290)&&Input.mouse_push?(M_LBUTTON)
        Scene.move_to(:game)
      end
      if (x>=150&&x<=350)&&(y>=365&&y<=415)&&Input.mouse_push?(M_LBUTTON)
        Scene.move_to(:game)
      end
    end
  end
end
