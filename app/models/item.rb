class Item < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
  validates :store, presence: true
end
