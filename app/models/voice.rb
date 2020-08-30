class Voice < ApplicationRecord
  validates :text, presence: true
end
