require 'swagger_helper'

RSpec.describe 'api/v1/sessions', type: :request do
  before do
    @user = User.create(username: "Test")
  end

  path '/api/v1/signup' do

    post('sign_up session') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: ['username']
      }
      response(200, 'successful') do
        let(:user) { {user: {username: "Emily"}} }
        run_test!
      end

      response(401, 'not found') do
        let(:user) { {user: {username: "Test"}} }
        run_test!
      end
    end
  end

  path '/api/v1/signin' do

    post('sign_in session') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          username: { type: :string }
        },
        required: ['username']
      }
      response(200, 'successful') do
        let(:user) { {user: {username: "Test"}}}
        run_test!
      end

      response(404, 'not found') do
        let(:user) { {user: {username: "Emily"}} }
        run_test!
      end
    end
  end
end
