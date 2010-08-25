require 'vklogic/session'

Authlogic::Session::Base.send(:include, VKLogic::Session)