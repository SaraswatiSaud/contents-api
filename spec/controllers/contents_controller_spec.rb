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

    it 'shows a list of urls and their contents' do
      content = FactoryBot.create(:content)
      get :index
      expect(assigns[:contents]).to eq([content])
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'responds successfully' do
        post :create
        expect(response).to be_success
      end

      it 'returns a 200 response' do
        post :create
        expect(response).to have_http_status '200'
      end

      it 'adds a new content in the database' do
        expect {
          FactoryBot.create(:content)
        }.to change{ Content.count }.by(1)
      end
    end

    context 'with invalid attributes' do
      it 'doesnot add a new content in the database' do
        content = FactoryBot.attributes_for(:content, :invalid)
        expect {
          post :create, params: { content: content }
        }.to_not change{ Content.count }
      end
    end
  end
end
