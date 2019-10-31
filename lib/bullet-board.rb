require 'bullet'
require 'bullet-board/ext/bullet'
require 'bullet-board/ext/notification'
require 'bullet-board/version'

module BulletBoard
  def self.configure_initialization &block
    configure_with_defaults
    block.call if block_given?
  rescue ConfigurationError => e
    Rails.logger.error "Error: #{e.message}"
    # change to false because we just want the customized logger
    # currently looping twice through UniformNotifier.active_notifiers in
    # Bullet#for_each_active_notifier_with_notification
  ensure
    Bullet.bullet_logger = false
    print_success_notification_to_stderr if Bullet.web_logger_enabled?
  end

  class ConfigurationError < StandardError
    def message
      "initialized with a bad configuration"
    end
  end

  private

  def self.configure_with_defaults
    Bullet.enable = true
    Bullet.web_logger = true
  end

  def self.print_success_notification_to_stderr
    STDERR.puts '┌─────────────────────────────────────────────────────────────────────────┐'
    STDERR.puts '│ Configured with the Bullet [https://github.com/flyerhzm/bullet]         │'
    STDERR.puts '│ and BulletBoard for reporting [https://github.com/townegr/bullet-board] │'
    STDERR.puts '└─────────────────────────────────────────────────────────────────────────┘'
  end
end
