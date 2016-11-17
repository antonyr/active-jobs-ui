require 'pstore'

module ActiveJobsUi
  class Store
    attr_accessor :store

    def initialize
      @store = PStore.new('job_data')
    end

    def setup(job_id, status, job)
      store.transaction do
        store[job_id] = { status: status, job: job }
      end
    end
  end
end
