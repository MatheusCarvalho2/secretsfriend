class Draw < ApplicationRecord
  validates :title, :min_value, :max_value, :date_draws, :date_present, :description, presence: true
end
