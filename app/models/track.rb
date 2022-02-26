class Track < ApplicationRecord
  
  validates :lyrics, :name, :ord, presence: true
  # can't use presence validation with boolean field
  validates :bonus, inclusion: { in: [true, false] }
  validates :ord, uniqueness: { scope: :album_id }

  # Each track will belong to one album
  belongs_to :album

  #Each track will belong to only one band
  has_one :band,
    through: :album,
    source: :band

  # Each user may provide many notes per track
  has_many :notes,
    dependent: :destroy

  after_initialize :set_defaults

  def set_defaults
    self.bonus ||= false
  end
end
