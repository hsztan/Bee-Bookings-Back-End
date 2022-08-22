class AddUserAndItemRefsToBooking < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :user, foreign_key: true
    add_reference :bookings, :item, foreign_key: true
  end
end
