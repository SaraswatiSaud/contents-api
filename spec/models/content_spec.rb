require 'rails_helper'

RSpec.describe Content, type: :model do
  it 'has a valid factory' do
    expect(FactoryBot.build(:content)).to be_valid
  end

  before(:each) do
    @content = FactoryBot.build(:content)
  end

  it 'is invalid without url' do
    @content.url = nil
    @content.valid?
    expect(@content.errors[:url]).to include("can't be blank")
  end

  it 'should have a valid url' do
    @content.url = 'http://google.com'
    expect(@content).to be_valid
  end
end
