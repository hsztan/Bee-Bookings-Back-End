class Item < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
