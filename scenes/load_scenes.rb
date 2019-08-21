require_relative 'title/TitleManager'
require_relative 'game/GameManager'
require_relative 'result/ResultManager'
require_relative 'levels/LevelsManager'

Scene.add(Title::TitleManager.new,  :title)
Scene.add(Game::GameManager.new,  :game)
# 先にインスタンス化してしまっている
Scene.add(Result::ResultManager.new,  :result)
Scene.add(Levels::LevelsManager.new,  :levels)
