require 'dxruby'


# coding: shift_jis
require_relative 'scene'
require_relative 'scenes/load_scenes'

Window.caption = "LoveType"
Window.width   = 900
Window.height  = 650

Scene.move_to(:title)
@@rank_font=Font.new(120)
@@title_font=Font.new(64)
# ↓フォントテスト　"UD デジタル 教科書体 N-B"
@@font = Font.new(32)




Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Scene.draw
  Scene.play

end
