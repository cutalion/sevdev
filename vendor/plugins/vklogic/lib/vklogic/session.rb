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
          validate :validate_by_vkontakte, :if => :authenticating_with_vkontakte?
        end
      end
            
      def credentials=(value)
        super
        values = value.is_a?(Array) ? value : [value]
        hash = values.first.is_a?(Hash) ? values.first.with_indifferent_access : nil
        self.vk_username = hash[:vk_username] if !hash.nil? && hash.key?(:vk_username)
      end
      
      def vk_username=(value)
        @vk_username = value
      end
      
      def validate_by_vkontakte
        vk_cookies = CGI::parse(controller.cookies[:vk_app_1930589])
        self.attempted_record = klass.send(:first, :conditions => { :vk_id => vk_cookies['mid'].first })

        unless self.attempted_record
          new_user = klass.new
          new_user.login = (@vk_username.nil?) ? 'vkontakte_user' : @vk_username
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