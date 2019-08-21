require 'dxruby'
require 'csv'
Encoding.default_external = "utf-8"

# coding: shift_jis
require_relative 'scene'
require_relative 'scenes/load_scenes'

Window.caption = "LoveType"
Window.width   = 900
Window.height  = 650

Scene.move_to(:title)
@@title_font=Font.new(64)
@@font = Font.new(32)

# CSV読み込み
@@keys = []
CSV.foreach("lovetype.csv") do |row|
  @@keys << row
end


Window.loop do
  break if Input.keyPush?(K_ESCAPE)
  Scene.draw
  Scene.play

end
