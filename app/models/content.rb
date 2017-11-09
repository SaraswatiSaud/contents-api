class Content < ApplicationRecord
  validates :url, url: true, presence: true
  validates :content, presence: true
end
