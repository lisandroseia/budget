# frozen_string_literal: true

class User < ActiveRecord::Base
  validates :name, presence: true, length: { minimum: 4, maximum: 30 }

  has_many :payments, foreign_key: 'author_id'
  has_many :categories
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
end
