module TimeWrapper
  module TimeAttribute
    extend ActiveSupport::Concern

    def time_attribute(*options)
      options.each do |attribute|
        raise TypeError.new("'#{attribute}' is not of column-type datetime") unless columns.detect{|column| column.name == attribute.to_s}.type.to_s == 'datetime'

        include ClassMethods

        define_method "#{attribute}=" do |value| set_time_wrapper_attribute(attribute,value) end
        define_method attribute do get_time_wrapper_attribute(attribute) end
        define_method "#{attribute}_time_wrapper_validation" do validate_time_wrapper_attribute(attribute) end

        validate "#{attribute}_time_wrapper_validation".to_sym
      end
    end

    module ClassMethods
      def set_time_wrapper_attribute(attribute,value)
        begin
          if value.kind_of? Time
            self[attribute] = value.utc
          else
            self[attribute] = Time.zone.parse(value)
          end
        rescue ArgumentError, NoMethodError
          instance_variable_set("@#{attribute}_time_wrapper_validation", true)
          instance_variable_set("@#{attribute}_wrong_value", value)
        end
      end

      def get_time_wrapper_attribute(attribute)
        if instance_variable_get("@#{attribute}_time_wrapper_validation")
          instance_variable_get("@#{attribute}_wrong_value")
        else
          Time.current.change({hour: self[attribute].hour, min: self[attribute].min}) if self[attribute]
        end
      end

      def validate_time_wrapper_attribute(attribute)
        errors.add(attribute,:wrong_time_format) unless send(attribute).blank? if instance_variable_get("@#{attribute}_time_wrapper_validation")
      end
    end
  end
end