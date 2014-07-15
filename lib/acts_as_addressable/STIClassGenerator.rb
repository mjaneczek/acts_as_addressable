module ActsAsAddressable
  class STIClassGenerator
    def initialize(address_types)
      @address_types = address_types
    end

    def generate
      @address_types.each do |type|
        define_class type unless Object.const_defined? class_name(type)
      end
    end

    private

    def define_class(type)
        Object.const_set(class_name(type), Class.new(Address))
    end

    def class_name(type)
      "#{type.to_s.split('_').collect!{ |w| w.capitalize }.join}Address"
    end
  end
end
