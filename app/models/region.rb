class Region < ApplicationRecord
  belongs_to :country
  has_many :boulders

  before_create :set_default_boulders_count

  private
  def set_default_boulders_count
    self.boulders = 0
  end
end
