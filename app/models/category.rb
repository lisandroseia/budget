# frozen_string_literal: true

class Category < ActiveRecord::Base
  validates :name, presence:true, length: {minimum: 4, maximum: 30}
  
  belongs_to :user
  has_many :operations
  has_many :payments, through: :operations
  has_one_attached :icon


  def total
    payments.sum(:amount) || 0
  end
end
