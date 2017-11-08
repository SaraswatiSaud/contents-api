class Content < ApplicationRecord
  validates :url, :content, presence: true
end
