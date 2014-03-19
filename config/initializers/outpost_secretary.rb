Rails.application.config.to_prepare do
  Secretary::Version.instance_eval do
    outpost_model
  end

  Outpost::ResourceController.instance_eval do
    include Outpost::Secretary::UserInjection
  end
end
