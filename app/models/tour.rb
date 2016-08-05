class Tour < ApplicationRecord
  validates :title, :duration, :amount, :description, :category_id, :guide_id,
            :location_id, presence: true

  has_attached_file :picture, styles: { medium: '300x300>', thumb: '100x100>' },
                              default_url: 'missing-tour.png'

  validates_attachment_content_type :picture, content_type: %r{\Aimage\/.*\Z}

  belongs_to :category
  belongs_to :location
  belongs_to :guide
  has_many :message
end
