# frozen_string_literal: true

class Category < ActiveRecord::Base
  belongs_to :user
  has_many :operations
  has_many :payments, through: :operations
  has_one_attached :icon

  def total
    payments.sum(:amount)
  end
end