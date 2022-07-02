# frozen_string_literal: true

class Payment < ActiveRecord::Base
  belongs_to :author, class_name: 'User'
  has_many :operations
  has_many :categories, through: :operations
end
