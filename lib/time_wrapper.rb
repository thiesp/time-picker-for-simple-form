require "time_wrapper/version"

require "time_wrapper/orm/active_record"
require "time_wrapper/locale/locale"
require "time_wrapper/simple_form_wrapper"

module TimeWrapper
  module Rails
    class Engine < ::Rails::Engine

    end
  end
end

