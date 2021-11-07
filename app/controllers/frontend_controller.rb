require_dependency 'application_controller'
class FrontendController < ApplicationController
    include ApplicationHelper
  
    # before_action :redirect_domain
        # def redirect_domain
        # 	if (request.host == 'www.diennuoctranchi.com') || (request.host == 'http://diennuoctranchi.com')
        # 		redirect_to 'https://diennuoctranchi.com' + request.fullpath, :status => 301
        # 	end
        # end
end