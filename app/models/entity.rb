class Entity < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :group

  validates :name, presence: true, length: { maximum: 50, minimum: 3 }
  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
