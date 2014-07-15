module ActsAsAddressable
  module Addressable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def acts_as_addressable(*args)
        has_many :addresses, as: :addressable, dependent: :destroy
      end
    end
  end
end
