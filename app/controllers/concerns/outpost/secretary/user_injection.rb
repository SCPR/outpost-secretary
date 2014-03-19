module Outpost
  module Secretary
    module UserInjection
      extend ActiveSupport::Concern

      included do
        before_filter :add_user_id_to_params, only: [:create, :update]
      end

      private

      def add_user_id_to_params
        if model.has_secretary?
          params[model.singular_route_key].merge!(logged_user_id: current_user.id)
        end
      end
    end
  end
end
