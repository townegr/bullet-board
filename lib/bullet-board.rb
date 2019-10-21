require 'bullet'
require 'bullet-board/logging'
require 'bullet-board/notification'
require 'bullet-board/version'

module BulletBoard
  # # TODO: yield and handle custom overrides by user
  def self.configure_initialization
    print_success_notification_to_stderr
    Bullet.enable = true
    Bullet.bullet_logger = false

    # change to false because we just want the customized logger
    # currently looping twice through UniformNotifier.active_notifiers in
    # Bullet#for_each_active_notifier_with_notification
    Bullet.rails_logger = false
    Bullet.web_logger = true
  end

  private

  def self.print_success_notification_to_stderr
    STDERR.puts '┌─────────────────────────────────────────────────────────────────────────┐'
    STDERR.puts '│ Configured with the Bullet [https://github.com/flyerhzm/bullet]         │'
    STDERR.puts '│ and BulletBoard for reporting [https://github.com/townegr/bullet-board] │'
    STDERR.puts '└─────────────────────────────────────────────────────────────────────────┘'
  end
end
