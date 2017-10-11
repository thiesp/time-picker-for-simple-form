require 'orm_adapter/adapters/active_record'
require 'time_wrapper/time_attribute'

ActiveSupport.on_load(:active_record) do
  extend TimeWrapper::TimeAttribute
end
