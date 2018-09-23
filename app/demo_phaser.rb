require 'opal-phaser'

class Image
  def initialize(game)
    @sprite_key = "logo"
    @sprite_url = "img/phaser.png"
    @game       = game
  end
  
  def preload
    @game.load.image(@sprite_key, @sprite_url)
  end
  
  def create
    @image = @game.add.sprite(@game.world.x_center, @game.world.y_center, @sprite_key)
    @image.anchor.set(0.5)
    @image.input_enabled = true
    
    @text = @game.add.text(@game.world.x_center, 16, '', { fill: '#ffffff' })
    @counter = 0
    listener = proc do
      @counter   += 1
      @text.text = "You clicked #{@counter} times!"
    end
    
    @image.events.on(:down, self, &listener)
  end
end

class BackGround

  def initialize game
    @game = game
  end

  def preload
    @game.load.image('background','img/starfield.png')
  end

  def create
    bg = @game.add.image(0,0,'background')
    bg.width  = $window.view.width
    bg.height = $window.view.height
  end

end

class Game
  def initialize
    game  = Phaser::Game.new(
      width: $window.view.width,
      height: $window.view.height
    )
    state = MainState.new game
    game.state.add :main, state, true
  end
end

class MainState < Phaser::State
  def initialize(game)
    @game = game
  end
  
  def preload
    @background = BackGround.new(@game)
    @background.preload
    @image = Image.new(@game)
    @image.preload
  end
  
  def create
    @background.create
    @image.create
  end
end

def demo_phaser_ce
  Game.new
end

