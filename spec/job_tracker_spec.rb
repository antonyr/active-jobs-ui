require 'spec_helper'

describe ActiveJobsUi::JobTracker do
  let(:store) { PStore.new('job_data') }
  let(:job_info) { store.transaction { store.roots.sort } }
  let(:job_id) { 'j0b-1d' }
  let(:job) { 'AddPersonToMailChimpJob' }
  let(:transaction) { store.transaction { store[job_id][:status] } }
  let(:tracker) { described_class.new(job_id, job) }

  describe '#enqueued' do
    it 'Job id should be stored with status queued' do
      tracker.enqueued
      expect(job_info).to include job_id
      expect(transaction).to eq 'queued'
    end
  end

  describe '#performing' do
    it 'Job id should be stored with status working' do
      tracker.performing
      expect(job_info).to include job_id
      expect(transaction).to eq 'working'
    end
  end

  describe '#completed' do
    it 'Job id should be stored with status completed' do
      tracker.completed
      expect(transaction).to eq 'completed'
    end
  end
end
