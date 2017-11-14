class Content < ApplicationRecord
  validates :url, url: true, presence: true  
end
