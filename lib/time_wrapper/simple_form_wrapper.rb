::SimpleForm.setup do |config|
  config.wrappers :time, tag: 'div', class: 'form-group', error_class: 'has-danger' do |b|
    b.use :html5
    b.use :placeholder
    b.use :label, class: 'form-control-label'
    b.wrapper tag: 'div', class: 'input-group time timepicker' do |input|
      input.use :input, class: 'form-control', autocomplete: :off
      input.wrapper tag: 'span', class: 'input-group-addon input-group-append' do |addon|
        addon.wrapper tag: 'span', class: 'input-group-text' do |text|
          text.wrapper tag: 'i', class: "fa fa-clock-o" do |_|
          end
        end
      end
    end
    b.use :error, wrap_with: { tag: 'small', class: 'text-help text-muted' }
    b.use :hint, wrap_with: { tag: 'p', class: 'text-help text-muted' }
  end
end
