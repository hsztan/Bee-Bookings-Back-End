require 'swagger_helper'

RSpec.describe 'api/v1/bookings', type: :request do
  before do
    @user = User.create(username: "Henry")
    @user_id = @user.id
    @item = Item.create(name: "MyItem", image: "MyImage", description: "This is my Item")
    @item_id = @item.id
    @booking = Booking.create(date: '12/02/2021', city: 'Madrid', user_id: @user_id, item_id: @item_id)
    @booking_id = @booking.id
  end

  path '/api/v1/bookings' do

    post('create booking') do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer },
          item_id: { type: :integer },
          date: { type: :date },
          city: { type: :string }
        },
        required: ['user_id', 'item_id', 'date', 'city']
      }
      response(201, 'successful') do
        let(:booking) { {booking: {user_id: @user_id, item_id: @item_id, date: '12/02/2021', city: 'Tokyo'}} }
        run_test!
      end
    end
  end

  path '/api/v1/bookings/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :string, description: 'id'

    get('show booking') do
      response(200, 'successful') do
        let(:id) { @booking_id }
        run_test!
      end
    end

    delete('delete booking') do
      response(204, 'successful') do
        let(:id) { @booking_id }
        run_test!
      end
    end
  end

  path '/api/v1/bookings/user' do

    post('user booking') do
      tags 'Bookings'
      consumes 'application/json'
      parameter name: :booking, in: :body, schema: {
        type: :object,
        properties: {
          user_id: { type: :integer }
        },
        required: ['user_id']
      }
      response(200, 'successful') do
        let(:booking) { {booking: {user_id: @user_id}} }
        run_test!
      end
    end
  end
end
