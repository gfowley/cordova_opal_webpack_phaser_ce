require 'native'

module Phaser

  AUTO   = `Phaser.AUTO`
  WEBGL  = `Phaser.WEBGL`
  CANVAS = `Phaser.CANVAS`

  class Game

    attr_reader :native, :config

    def initialize config, &block
      @config = config
      @native = Native `new Phaser.Game(#{config.to_n})`
    end

  end

end

