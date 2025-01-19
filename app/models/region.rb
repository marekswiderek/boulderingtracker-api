class Region < ApplicationRecord
  belongs_to :country

  before_create :set_default_boulders_count

  private
  def set_default_boulders_count
    self.boulders = 0
  end
end
