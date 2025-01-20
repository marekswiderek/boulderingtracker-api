class Boulder < ApplicationRecord
  belongs_to :region
  has_many :ascents

  before_create :set_default_ascents_count
  after_create :increase_region_boulders_count
  after_destroy :decrease_region_boulders_count

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
