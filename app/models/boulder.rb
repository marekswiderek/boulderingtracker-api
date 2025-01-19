class Boulder < ApplicationRecord
  belongs_to :region

  before_create :set_default_ascents_count
  after_create :increase_region_boulders_count
  after_delete :decrease_region_boulders_count

  private
  def set_default_ascents_count
    self.ascents = 0
  end

  def increase_region_boulders_count
    self.region.boulders += 1
  end

  def decrease_region_boulders_count
    self.region.boulders -= 1
  end
end
