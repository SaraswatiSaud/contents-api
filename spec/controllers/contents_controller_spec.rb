require 'rails_helper'

RSpec.describe ContentsController, type: :controller do

  describe 'GET #index' do
    it 'responds successfully' do
      get :index
      expect(response).to be_success
    end

    it 'returns a 200 response' do
      get :index
      expect(response).to have_http_status '200'
    end
  end

  describe 'POST #create' do
    it 'responds successfully' do
      post :create
      expect(response).to be_success
    end

    it 'returns a 200 response' do
      post :create
      expect(response).to have_http_status '200'
    end
  end
end
