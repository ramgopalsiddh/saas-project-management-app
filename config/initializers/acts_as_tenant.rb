# Add for pervent access data by other tenant
ActsAsTenant.configure do |config|
  config.require_tenant = true
end