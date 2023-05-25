require 'swagger_helper'

describe 'Users API' do

  path '/users' do
    post 'Creates a user' do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string },
          password: { type: :string }
        },
        required: [ 'email', 'password' ]
      }

      response '201', 'user created' do
        let(:user) { { email: 'test@mail.com', password: '123123123' } }
        run_test!
      end
    end
  end
end