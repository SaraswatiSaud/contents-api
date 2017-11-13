require 'rails_helper'

RSpec.describe 'Contents API', type: :request do
  describe 'GET /contents' do
    let!(:contents) { FactoryBot.create_list(:content, 10) }

    before(:each) { get '/contents' }

    it 'sends a list of url' do
      expect([json]).not_to be_empty
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /contents' do
    it 'creates a content' do
      expect {
        FactoryBot.create(:content)
        post '/contents'
      }.to change{ Content.count }.by(1)
      expect(response).to have_http_status(:success)
    end
  end
end
