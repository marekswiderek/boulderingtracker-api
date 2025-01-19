class Region < ApplicationRecord
  belongs_to :country
  has_many :boulders

  before_create :set_default_boulders_count

  private
  def set_default_boulders_count
    self.boulders_count = 0
  end
end
