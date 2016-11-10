require 'spec_helper'

describe ActiveJobsUi::Store do
  let(:job_id) { 'j0b-1d' }
  let(:job) { 'AddPersonToMailChimpJob' }
  let(:status) { 'completed' }

  describe '#setup' do
    subject(:setup) { ActiveJobsUi::Store.new.setup(job_id, status, job) }
    it { is_expected.to be_a_kind_of(Hash) }
    specify { expect(setup.keys).to include(:job, :status) }
    specify { expect(setup.values).to include(job, status) }
  end
end
