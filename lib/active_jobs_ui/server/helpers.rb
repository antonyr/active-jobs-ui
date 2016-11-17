ActiveJobsUi::Server.helpers do
  def job_entries_info
    @store = PStore.new('job_data')
    job_ids = @store.transaction { @store.roots.sort }
    job_ids.each do |job_id|
      puts @store.transaction { "#{job_id} - #{@store[job_id]}" }
    end
  end
end
