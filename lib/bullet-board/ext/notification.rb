require 'bullet'
require 'pry'

module Bullet
  module Notification
      class UnusedEagerLoading
        attr_accessor :counter

        def initialize callers, base_class, associations, path = nil
          super base_class, associations, path

          @callers = callers
          @counter = 0
        end

        def notification_data
          if self.notifier == UniformNotifier::CustomizedLogger
            self.counter += 1
            puts "Call UnusedEagerLoading count: #{self.counter}"
          end

          super
        end
      end

      class NPlusOneQuery
        attr_accessor :counter

        def initialize callers, base_class, associations, path = nil
          super base_class, associations, path

          @callers = callers
          @counter = 0
        end

        def notification_data
          if self.notifier == UniformNotifier::CustomizedLogger
            self.counter += 1
            puts "Call NPlusOneQuery count: #{self.counter}"
          end

          super
        end
      end
  end
end
