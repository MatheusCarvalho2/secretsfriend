class DrawUser < ApplicationRecord
  belongs_to :draw
  belongs_to :user
  has_many :user
  validates :owner, presence: true
end
