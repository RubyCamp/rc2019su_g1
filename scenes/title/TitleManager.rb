module Title
  class TitleManager
    def initialize
      @title_img = Image.load("images/castle-1030461_1280.jpg")


    end

    def play
      Window.draw(0, 0, @title_img)
      Window.draw_font(200,300,"Please Push ENTER", @@title_font)
      if Input.keyPush?(K_RETURN)
        Scene.move_to(:levels)
      end
    end
  end
end
