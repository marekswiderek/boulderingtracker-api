class Ascent < ApplicationRecord
  belongs_to :user
  belongs_to :boulder

  after_create :increase_boulder_ascents_count
  after_destroy :decrease_boulder_ascents_count

  validates :user_id, :boulder_id, :ascent_date, :attempts, presence: true

  private
  def increase_boulder_ascents_count
    self.boulder.ascents_count += 1
    self.boulder.save
  end

  def decrease_boulder_ascents_count
    self.boulder.ascents_count -= 1
    self.boulder.save
  end
end
