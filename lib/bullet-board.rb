require "bullet-board/version"
require "bullet"

module BulletBoard
  def self.configure_initialization
    Bullet.enable = true
    Bullet.bullet_logger = true
  end
end
