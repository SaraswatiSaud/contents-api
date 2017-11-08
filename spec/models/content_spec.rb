require 'rails_helper'

RSpec.describe Content, type: :model do
  it { should validate_presence_of(:url) }
  it { should validate_presence_of(:content) }
end
