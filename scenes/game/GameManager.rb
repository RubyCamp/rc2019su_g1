require 'dxruby'
# coding: shift_jis


module Game
  class GameManager
    def initialize
      @j = 0
      @i = 0
    end

    def play

      Window.draw_font(200,300,"Please Push ENTER", @@font)

      if @@keys.length > @j
        textarray = @@keys[@j][2].split("")
        textLength = textarray.length

        key = Object.const_get("K_"+textarray[@i].upcase)
        puts "問題番号#{@j}"
        puts @@keys[@j][0]
        puts @@keys[@j][2]
        puts textarray[@i]
        if Input.keyPush?(key)
          puts "sucsess!!!!!!!!!!"
          @i += 1
        end


        if textLength-1 < @i
          @i=0
          @j+=1
        end
      end

      if @j > @@keys.length-1
        Scene.move_to(:result)
      end

    end

  end
end
