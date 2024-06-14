class DrawUser < ApplicationRecord
  belongs_to :draw
  belongs_to :user

  validates :owner, presence: true
end
