require 'swagger_helper'

RSpec.describe 'api/v1/items', type: :request do
  before do
    @item = Item.create(name: 'bee', image: 'image_url', description: "It's a bee")
    @id = @item.id
  end

  path '/api/v1/items' do
    get('list items') do
      response(200, 'successful') do
        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    post('create item') do
      tags 'Items'
      consumes 'application/json'
      parameter name: :item, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string },
          image: { type: :string },
          description: { type: :string }
        },
        required: %w[name image description]
      }
      response(201, 'successful') do
        let(:item) { { name: 'foo', image: 'bar', description: 'nix' } }
        run_test!
      end
    end
  end

  path '/api/v1/items/{id}' do
    # You'll want to customize the parameter types...
    parameter name: 'id', in: :path, type: :integer, description: 'id'

    get('show item') do
      response(200, 'successful') do
        let(:id) { @id }

        after do |example|
          example.metadata[:response][:content] = {
            'application/json' => {
              example: JSON.parse(response.body, symbolize_names: true)
            }
          }
        end
        run_test!
      end
    end

    delete('delete item') do
      response(204, 'successful') do
        let(:id) { @id }
        run_test!
      end
    end
  end
end
