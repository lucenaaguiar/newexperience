class Message < ApplicationRecord
  validates :name, :email, presence: true
  belongs_to :tour
end
