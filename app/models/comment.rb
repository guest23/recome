class Comment < ApplicationRecord
  belongs_to :voice
  belongs_to :user
end
