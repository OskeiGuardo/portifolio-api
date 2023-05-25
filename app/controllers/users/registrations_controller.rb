class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json

  private

  def respond_with(resource, options={})
    if resource.persisted?
      render json: {
        record: {
          status: 200,
          message: 'signed up sucessfully',
          data: resource
        }, status: :ok
      }
    else
      render json: {
        record: {
          message: 'not signed up',
          errors: resource.errors.full_messages
        }, status: :unprocessable_entity
      }
    end
  end
end
