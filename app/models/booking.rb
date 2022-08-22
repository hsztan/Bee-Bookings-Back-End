class Booking < ApplicationRecord
  belongs_to :item
  belongs_to :user
  before_save :set_date

  def set_date
    self.date = date.to_date
  end
end
