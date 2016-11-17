module ActiveJobsUi
  class JobTracker
    def initialize(job_id, job)
      @store = ActiveJobsUi::Store.new
      @job_id = job_id
      @job = job
    end

    def enqueued
      store.setup(job_id, 'queued', job)
    end

    def performing
      store.setup(job_id, 'working', job)
    end

    def completed
      store.setup(job_id, 'completed', job)
    end

    private

    attr_reader :job_id, :store, :job
  end
end
