module Outpost
  module Secretary
    class Engine < ::Rails::Engine
      # This is necessary to support rails 3, which doesn't autoload
      # the concerns directory
      config.autoload_paths << File.expand_path(
        "../../../../app/controllers/concerns", __FILE__)

      Rails.application.config.to_prepare do
        # Make versions an outpost model so it can be represented in Outpost.
        ::Secretary::Version.instance_eval do
          outpost_model
        end

        # Add user injection callback to resource controller.
        Outpost::ResourceController.instance_eval do
          include Outpost::Secretary::UserInjection
        end
      end
    end
  end
end
