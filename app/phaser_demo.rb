
def phaser_demo

  create = proc do
    this = Native `this`
    x_center = this.game.config.width  / 2
    y_center = this.game.config.height / 2
    bg = this.add.image x_center, y_center, 'sky'
    bg.setDisplaySize this.game.config.width, this.game.config.height
    particles = this.add.particles 'red'
    emitter = particles.createEmitter( { speed: 100, scale: { start: 1, end: 0 }, blendMode: 'ADD' } )
    logo = this.physics.add.image x_center, y_center, 'logo'
    logo.setVelocity 100, 200
    logo.setBounce 1, 1
    logo.setCollideWorldBounds true
    emitter.startFollow logo
  end

  preload = proc do
    this = Native `this`
    this.load.setBaseURL 'http://localhost:8000/'
    this.load.image 'sky',  'img/space3.png'
    this.load.image 'logo', 'img/phaser3-logo.png'
    this.load.image 'red',  'img/red.png'
  end

  config = {
    type:    Phaser::AUTO,
    width:   $window.view.width,
    height:  $window.view.height,
    physics: {
      default: 'arcade',
      arcade:  {
        gravity: { y: 200 }
      }
    },
    scene:   {
      preload: preload,
      create:  create
    }
  }

  Phaser::Game.new config
end

