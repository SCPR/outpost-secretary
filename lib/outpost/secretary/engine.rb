module Outpost
  module Secretary
    class Engine < ::Rails::Engine
      # This is necessary to support rails 3, which doesn't autoload
      # the concerns directory
      config.autoload_paths << File.expand_path("../../../../app/controllers/concerns", __FILE__)
    end
  end
end
