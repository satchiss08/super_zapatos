class Store < ActiveRecord::Base
  has_many :articles
  validates :name, presence: true
  validates :address, presence: true
end
