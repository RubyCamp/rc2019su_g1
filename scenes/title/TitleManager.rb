module Title
  class TitleManager
    def initialize
      @title_img = Image.load("images/castle-1030461_1280.jpg")


    end

    def play
<<<<<<< HEAD
      Window.draw(0, 0, @title_img)
      Window.draw_font(200,300,"Please Push ENTER", @@title_font)
      if Input.keyPush?(K_RETURN)
        Scene.move_to(:levels)
=======
      puts "Title"
      Window.draw_font(0,0,"うんこ", @@font)
      @timer -= 1
      if @timer <= 0
        @timer = 3*60
        
        Scene.move_to(:game)
>>>>>>> 44b59aa9afa36099cecad9a81ed65fb2befd412b
      end
    end
  end
end
