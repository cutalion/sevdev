module VKLogic
  module Session
    def self.included(klass)
      klass.class_eval do
        extend Config
        include InstanceMethods
      end
    end
  
    module Config
      # reserved for configurational purposes
    end

    module InstanceMethods
      def self.included(klass)
        klass.class_eval do
          # WTF? should be validate callback, but something wrong here
          persist :validate_by_vkontakte, :if => :authenticating_with_vkontakte?
        end
      end
      
      def credentials
        if authenticating_with_vkontakte?
          details = {}
          details[:vk_session] = 'later'
          details
        else
          super
        end
      end
      
      def credentials=(value)
         super
         values = [:vk_session]
      end
    
      def validate_by_vkontakte
        new_user = klass.new
        new_user.login = 'presskey'

        self.attempted_record = new_user
        self.attempted_record.save_with_validation(false)
      end
      
      def authenticating_with_vkontakte?
        true
      end
      
    end
  end
end