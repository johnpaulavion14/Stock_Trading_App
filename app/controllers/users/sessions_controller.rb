# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  def create
    super
    if @user.save
      UserMailer.with(user: @user).welcome_email.deliver_now
    end
    # def create
    #   @user = User.new(user_params)
  
    #   respond_to do |format|
    #     if @user.save
    #       # Tell the UserMailer to send a welcome email after save
    #       UserMailer.with(user: @user).welcome_email.deliver_later
  
    #       format.html { redirect_to(@user, notice: 'User was successfully created.') }
    #       format.json { render json: @user, status: :created, location: @user }
    #     else
    #       format.html { render action: 'new' }
    #       format.json { render json: @user.errors, status: :unprocessable_entity }
    #     end
    #   end
    # end
  end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  protected

  # If you have extra params to permit, append them to the sanitizer.
  def configure_sign_in_params
    devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  end
end
