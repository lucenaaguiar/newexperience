class Location < ApplicationRecord
  validates :state, :city, presence: true
  has_many :tours
  has_many :guides
  def local
    "#{city}, #{state}"
  end
end
