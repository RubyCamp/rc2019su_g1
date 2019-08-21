require 'dxruby'
# coding: shift_jis


module Game
  class GameManager
    def initialize
      @j = 0
      @i = 0
      @textarray=[]
      @@failed = 0
      @pointflag = true
      Scene.set_val(:start_time, Time.now)
    end

    def play
      if @@keys.length > @j
        @textarray = @@keys[@j][2].split("")
        @textLength = @textarray.length

        key = Object.const_get("K_"+@textarray[@i].upcase)

        keys = Input.keys
        if keys.include?(key)
          # 成功時の処理
          puts "成功"
          @i += 1
        end


          if @pointflag
            if keys.length > 0
              if keys.include?(key) == false
                # タイプ失敗時の処理
                @@failed += 1
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
        end
      end

      # ↓仮のIF文
      if Input.keyPush?(K_W)
      # if @j > @@keys.length-1

        Scene.scenes[:result].set_end_time
        Scene.move_to(:result)

      end

    end

    def draw
      Window.draw_font(0,0,"#{@@keys[@j][0]}",@@font)
      Window.draw_font(0,40,"#{@@keys[@j][2]}",@@font)
      Window.draw_font(0,80,"#{@textarray[@i]}",@@font)
      # 押しているキーの配列の描画
      # 消してOK
      Window.draw_font(0,150,"#{Input.keys}",@@font)
      # 間違った回数の描画
      # 消してOK
      Window.draw_font(0,180,"#{@@failed}",@@font)
      
    end
  end
end
