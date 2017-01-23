require "rails_helper"

RSpec.describe Job, :type => :model do
  it 'should be valid' do
    job = Job.create()
    expect(job).not_to be_valid
    expect(job.errors[:title]).to include("can't be blank")
    expect(job.errors[:location]).to include("can't be blank")
    expect(job.errors[:description]).to include("can't be blank")
    expect(job.errors[:category]).to include("can't be blank")
  end
end
