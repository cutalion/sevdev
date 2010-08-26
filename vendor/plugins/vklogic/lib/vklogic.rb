require 'vklogic/acts_as_authentic'
require 'vklogic/session'

ActiveRecord::Base.send(:include, VKLogic::ActsAsAuthentic)
Authlogic::Session::Base.send(:include, VKLogic::Session)