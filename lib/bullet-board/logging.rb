module Bullet
  module BulletExtensions
    def notification?
      UniformNotifier.customized_logger = generate_web_log_file if web_logger_enabled?

      super
    end
  end

  class << self
    prepend BulletExtensions

    def web_logger_enabled?
      !!@web_logger_enabled
    end

    def web_logger=(active)
      active = (!!active == active) ? active : false
      @web_logger_enabled = active
    end

    def app_root
      (defined?(::Rails.root) ? Rails.root.to_s : Dir.pwd).to_s
    end

    def generate_web_log_file
      FileUtils.mkdir_p(app_root + '/log')
      filename = "#{app_root}/log/#{Time.new.utc.strftime("%Y%m%d%H%M%S")}_blogger.log"
      web_log_file = File.open(filename, 'a+')
      web_log_file.tap { |f| f.sync = true }
    end
  end
end
