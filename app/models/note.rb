class Note < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :description, presence: true, length: { minimum: 5 }
end

