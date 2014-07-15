module ActsAsAddressable
  module Addressable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def acts_as_addressable(*address_types)
        create_relations_for_types address_types
        ActsAsAddressable::STIClassGenerator.new(address_types).generate
      end

      def create_relations_for_types(address_types)
        has_many :addresses, as: :addressable, dependent: :destroy

        address_types.each do |type|
          has_many "#{type}_addresses".to_sym, as: :addressable, dependent: :destroy
        end
      end
    end
  end
end
