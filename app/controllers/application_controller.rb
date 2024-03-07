class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  set_current_tenant_by_subdomain_or_domain(:account, :subdomain, :domain)

#   before_action do 
#     binding.irb
#   end
end
