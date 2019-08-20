require_relative 'title/TitleManager'
require_relative 'game/GameManager'
require_relative 'result/ResultManager'

Scene.add(Title::TitleManager.new,  :title)
Scene.add(Game::GameManager.new,  :game)
Scene.add(Result::ResultManager.new,  :result)
