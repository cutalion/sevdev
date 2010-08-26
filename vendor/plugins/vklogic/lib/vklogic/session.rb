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
          # WTF? should be validate callback, but works while using persist
          persist :validate_by_vkontakte, :if => :authenticating_with_vkontakte?
        end
      end
      
      def validate_by_vkontakte
        vk_cookies = CGI::parse(controller.cookies[:vk_app_1930589])
        self.attempted_record = klass.send(:first, :conditions => { :vk_id => vk_cookies['mid'].first })
        
        unless self.attempted_record
          new_user = klass.new
          new_user.login = 'vkontakte_user'
          new_user.vk_id = vk_cookies['mid'].first
          self.attempted_record = new_user
          self.attempted_record.save
        end
      end
      
      def authenticating_with_vkontakte?
        attempted_record.nil? && errors.empty? && !controller.cookies[:vk_app_1930589].nil?
      end
      
    end
  end
end