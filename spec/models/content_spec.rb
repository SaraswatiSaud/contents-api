require 'rails_helper'

RSpec.describe Content, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.build(:content)).to be_valid
  end

  it 'is invalid without url' do
    content = FactoryGirl.build(:content, url: nil)
    content.valid?
    expect(content.errors[:url]).to include("can't be blank")
  end

  it 'is invalid without content' do
    content = FactoryGirl.build(:content, content: nil)
    content.valid?
    expect(content.errors[:content]).to include("can't be blank")
  end

  
end
