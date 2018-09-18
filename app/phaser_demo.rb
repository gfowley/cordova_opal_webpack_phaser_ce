
# TODO: Phaser in JS to test setup .... convert to Ruby!

def start_phaser_demo
`
function preload ()
{
  this.load.setBaseURL('http://localhost:8000/');
  this.load.image('sky', 'img/space3.png');
  this.load.image('logo', 'img/phaser3-logo.png');
  this.load.image('red', 'img/red.png');
}

function create ()
{
  this.add.image(window.innerWidth * window.devicePixelRatio / 2,
                 window.innerHeight * window.devicePixelRatio / 2,
                 'sky');
  var particles = this.add.particles('red');
  var emitter = particles.createEmitter({
    speed: 100,
    scale: { start: 1, end: 0 },
    blendMode: 'ADD'
  });
  var logo = this.physics.add.image(window.innerWidth * window.devicePixelRatio / 2,
                                    window.innerHeight * window.devicePixelRatio / 4,
                                    'logo');
  logo.setVelocity(100, 200);
  logo.setBounce(1, 1);
  logo.setCollideWorldBounds(true);
  emitter.startFollow(logo);
}

function config() {
  var config = {
    type: Phaser.AUTO,
    width: window.innerWidth * window.devicePixelRatio,
    height: window.innerHeight * window.devicePixelRatio,
    physics: {
      default: 'arcade',
               arcade: {
                 gravity: { y: 200 }
               }
    },
    scene: {
      preload: preload,
      create: create
    }
  };
  return config;
}

var game = new Phaser.Game(config());
`
end
