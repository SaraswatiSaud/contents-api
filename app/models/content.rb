class Content < ApplicationRecord
  validates_presence_of :url, :content
end
