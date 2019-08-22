module Result
  class ResultManager
    def initialize
      @start_time = Scene.get_val(:start_time)
      @time = 0
    end

    def play
      if Input.keyPush?(K_S)
        Scene.move_to(:title)
      end
    end

    def set_end_time
      @time = Scene.set_val(:end_time, Time.now) - @start_time
    end

    def draw
      Window.draw_font(0,0,"#{@time}",@@font)
    end

  end

end

# 2週目のtitle画面でボタンを押した瞬間におちる
