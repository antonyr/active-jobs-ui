module ActionDispatch
  module Routing
    class Mapper
      def mount_active_jobs_ui_engine_at(mount_location = 'jobs-ui')
        Rails.application.routes.draw do
          mount ActiveJobsUi::Engine => mount_location
        end
        ActiveJobsUi::Engine.routes.draw do
          root to: 'active_jobs_ui/dashboard#index'
        end
      end
    end
  end
end
