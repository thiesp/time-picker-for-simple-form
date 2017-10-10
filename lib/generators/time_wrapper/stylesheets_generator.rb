require 'rails/generators'

module TimeWrapper
  module Generators
    class StylesheetsGenerator < ::Rails::Generators::Base

      desc <<-DOC
        time_wrapper.scss
      DOC

      def self.source_root
        File.expand_path(File.join(File.dirname(__FILE__), '../../../app/assets/stylesheets'))
      end

      def initialize(*args, &block)
        super
        generate_stylesheets
      end

      private

      def generate_stylesheets
        template "time_wrapper.scss", "app/assets/javascripts/time_wrapper.scss"
      end
    end
  end
end

