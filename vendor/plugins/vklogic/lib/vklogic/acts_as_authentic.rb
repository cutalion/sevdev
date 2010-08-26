module VKLogic
  module ActsAsAuthentic
    def self.included(klass)
      klass.class_eval do
        extend Config
        add_acts_as_authentic_module(Methods, :prepend)
      end
    end
    
    module Config
    end
    
    module Methods
      def self.included(klass)
        klass.class_eval do
          validate :validate_by_vkontakte, :if => :authenticating_with_vkontakte?
        end
      end
    end
    
  end 
end