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
  end

  def on_click_play sound
    @image.input_enabled = true
    listener = proc do
      sound.play
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
    @game.scale.scale_mode = Phaser::ScaleManager::SHOW_ALL
    @game.add.tile_sprite(0,0,@game.width,@game.height,'background')
  end
end

class Blaster
  def initialize game
    @game = game
  end

  def preload
    @game.load.audio('blaster','audio/blaster.mp3')
  end

  def create
    @sound = @game.add.audio('blaster')
  end

  def play
    @sound.play
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
    @blaster = Blaster.new(@game)
    @blaster.preload
  end
  
  def create
    @background.create
    @image.create
    @blaster.create
    @image.on_click_play @blaster
  end
end

def demo_phaser_ce
  $game  = Phaser::Game.new(
    width: $window.view.width,
    height: $window.view.height
  )
  state = MainState.new $game
  $game.state.add :main, state, true
  $game
end

