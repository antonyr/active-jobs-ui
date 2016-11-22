require 'pstore'

module ActiveJobsUi
  class Store
    attr_accessor :pstore

    FILE_NAME = 'job_data.pstore'

    def initialize
      @pstore = PStore.new(FILE_NAME)
    end

    def setup(job_id, status, job)
      pstore.transaction do
        pstore[job_id] = { status: status, job: job }
      end
    end

    def entries
      pstore.transaction { pstore.roots.sort }
    end

    def status(job_id)
      pstore.transaction { pstore[job_id][:status] }
    end
  end
end
