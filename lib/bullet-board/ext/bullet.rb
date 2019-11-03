module Bullet
  module BulletExtensions
    def notification?
      UniformNotifier.customized_logger = make_board_log if notify_with_new_request?
      requests << current_connection_id

      super
    end
  end

  class << self
    prepend BulletExtensions

    @@requests = Set.new

    def bullet_logger= active
      raise BulletBoard::ConfigurationError if active
    end

    def web_logger_enabled?
      enable? && !!@web_logger_enabled
    end

    def web_logger= active
      active = (!!active == active) ? active : false
      @web_logger_enabled = active
    end

    def new_request? id
      !requests.include? id
    end

    def requests
      @@requests
    end

    def current_connection_id
      @_current_connection_id ||= Thread.current["ActiveRecord::RuntimeRegistry"].connection_id
    end

    def notify_with_new_request?
      web_logger_enabled? &&
      new_request?(current_connection_id) &&
      notification_collector.notifications_present?
    end

    def make_board_log
      app_root = (defined?(::Rails.root) ? Rails.root.to_s : Dir.pwd).to_s
      FileUtils.mkdir_p(app_root + '/log')
      filename = "#{app_root}/log/#{Time.new.utc.strftime("%Y%m%d%H%M%S")}_bullet_board.log"
      web_log_file = File.open(filename, 'a+')
      web_log_file.tap { |f| f.sync = true }
    end
  end
end
