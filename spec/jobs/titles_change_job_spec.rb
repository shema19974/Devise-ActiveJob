require 'rails_helper'

RSpec.describe TitlesChangeJob, type: :job do
  let(:blog){Blog.create(id: 1, title: 'Student', content: 'A good student')}
  
  it 'if the job was enqueued' do
    expect {
      TitlesChangeJob.set(wait_until: Date.tomorrow.noon).perform_later(blog.id)
    }.to have_enqueued_job(TitlesChangeJob).at(Date.tomorrow.noon)
  end
  it 'if the title was changed after Job execution' do
    perform_enqueued_jobs do
      TitlesChangeJob.set(wait_until: Date.tomorrow.noon).perform_later(blog.id)
    end
    expect(Blog.find(1).title).to eq 'Student'
  end
end
