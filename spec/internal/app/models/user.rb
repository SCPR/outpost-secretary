class User < ActiveRecord::Base
  include Outpost::Model::Authentication

  # TODO These methods are hacks because outpost has authorization hardcoded in.
  def can_manage?(*)
    true
  end

  def allowed_resources
    Outpost.config.registered_models
  end
end
