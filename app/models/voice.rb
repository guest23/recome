class Voice < ApplicationRecord
  belongs_to :user
  has_many :comments
  validates :text, presence: true

  def self.search(search)
    if search != ""
      Voice.where('text LIKE(?)', "%#{search}%")
    else
      Voice.all
    end
  end
end
