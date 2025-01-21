class Boulder < ApplicationRecord
  belongs_to :region
  has_many :ascents

  before_create :set_default_ascents_count
  after_create :increase_region_boulders_count
  after_destroy :decrease_region_boulders_count

  validates :name, :region_id, presence: true
  validates :grade, inclusion: { in: %W[ 4 5 5+ 6A 6A+ 6B 6B+ 6C 6C+ 7A 7A+ 7B 7B+ 7C 7C+ 8A 8A+ 8B 8B+ 8C 8C+ 9A ],
            message: "%{:grade} is not a valid font-grade." }

  private
  def set_default_ascents_count
    self.ascents_count = 0
  end

  def increase_region_boulders_count
    self.region.boulders_count += 1
    self.region.save
  end

  def decrease_region_boulders_count
    self.region.boulders_count -= 1
    self.region.save
  end
end
