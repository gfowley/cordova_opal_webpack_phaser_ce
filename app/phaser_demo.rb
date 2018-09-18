
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
  this.add.image(400, 300, 'sky');
  var particles = this.add.particles('red');
  var emitter = particles.createEmitter({
    speed: 100,
    scale: { start: 1, end: 0 },
    blendMode: 'ADD'
  });
  var logo = this.physics.add.image(400, 100, 'logo');
  logo.setVelocity(100, 200);
  logo.setBounce(1, 1);
  logo.setCollideWorldBounds(true);
  emitter.startFollow(logo);
}

function config() {
  var config = {
    type: Phaser.AUTO,
    width: 800,
    height: 600,
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
