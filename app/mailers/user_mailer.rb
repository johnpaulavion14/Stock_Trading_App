class UserMailer < ApplicationMailer
    default from: 'notifications@example.com'

  def welcome_email
    @user = params[:user]
    @url  = 'https://jp-stock.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Welcome to Stock Trading App')
  end
end
