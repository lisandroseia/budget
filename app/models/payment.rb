# frozen_string_literal: true

class Payment < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }
  validates :amount, presence: true, numericality: { only_integer: true, other_than: 0 }

  belongs_to :author, class_name: 'User'
  has_many :operations
  has_many :categories, through: :operations
end
