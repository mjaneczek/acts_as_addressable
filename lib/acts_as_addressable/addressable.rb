module ActsAsAddressable
  module Addressable
    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def acts_as_addressable(*args)

      end
    end
  end
end
