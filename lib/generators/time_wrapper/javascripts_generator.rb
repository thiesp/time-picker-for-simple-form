require 'rails/generators'

module TimeWrapper
  module Generators
    class JavascriptsGenerator < ::Rails::Generators::Base

      desc <<-DOC
        time_wrapper/time_wrapper.coffee.erb
        time_wrapper.js
      DOC

      def self.source_root
        File.expand_path(File.join(File.dirname(__FILE__), '../../../app/assets/javascripts'))
      end

      def initialize(*args, &block)
        super
        generate_javascripts
      end

      private

      def generate_javascripts
        template "time_wrapper.js", "app/assets/javascripts/time_wrapper.js"
        copy_file "time_wrapper/time_wrapper.coffee.erb", "app/assets/javascripts/time_wrapper/time_wrapper.coffee.erb"
      end
    end
  end
end

