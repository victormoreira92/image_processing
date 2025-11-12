# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  include RackSessionFix

  respond_to :json
  after_action :handle_failed_login, :only => :create
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # #POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
  private

  def respond_with(resource, _opts = {})
    render json: {
      status: { message: 'Logged in sucessfully.'},
      data: UserSerializer.new(resource).serializable_hash[:data][:attributes]
    }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      render json: {
        message: "logged out successfully"
      }, status: :ok
    else
      render json: {
        message: "Couldn't find an active session."
      }, status: :unauthorized
    end
  end

  def handle_failed_login
    if failed_login?
      render json: { success: false, errors: ["Login Credentials Failed"] }, status: 401
    end
  end

  def failed_login?
    (options = env["warden.options"]) && options[:action] == "unauthenticated"
  end
end
