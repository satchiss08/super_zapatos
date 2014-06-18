class Article < ActiveRecord::Base
  belongs_to :store
  validates :name, presence: true
  validates :store_id, presence: true
end
