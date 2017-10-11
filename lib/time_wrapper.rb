require "time_wrapper/version"

require "time_wrapper/orm/active_record"

module TimeWrapper
  module Rails
    class Engine < ::Rails::Engine
      initializer 'time_wrapper.setup_simple_form' do
        ::SimpleForm.setup do |config|
          config.wrappers :time, tag: 'div', class: 'form-group', error_class: 'has-danger' do |b|
            b.use :html5
            b.use :placeholder
            b.use :label, class: 'form-control-label'
            b.wrapper tag: 'div', class: 'input-group time timepicker' do |input|
              input.use :input, class: 'form-control', autocomplete: :off
              input.wrapper tag: 'span', class: 'input-group-addon' do |addon|
                addon.wrapper tag: 'i', class: "fa fa-clock-o" do |_|
                end
              end
            end
            b.use :error, wrap_with: { tag: 'small', class: 'text-help text-muted' }
            b.use :hint, wrap_with: { tag: 'p', class: 'text-help text-muted' }
          end
        end
      end
    end
  end
end

ActiveSupport.on_load(:i18n) do
  I18n.load_path << "#{File.dirname(__FILE__)}/time_wrapper/locale/en.yml"
  I18n.load_path << "#{File.dirname(__FILE__)}/time_wrapper/locale/da.yml"
end