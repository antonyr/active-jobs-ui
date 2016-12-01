module ActiveJobsUi
  class DashboardController < ApplicationController
    layout 'active_job_application'
    def index
      @store = ActiveJobsUi::Store.new
    end
  end
end
