class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.account_activation.subject
  #

  # See the create method of the Users controller
  def account_activation(user)
    # The user being activated. Defining this instance variable here allows us
    # to create the necessary links using the named edit route and embedded Ruby
    # in the account activation views in views/user_mailer
    #
    # Note that because activation_token is an attribute of User, it becomes
    # available for use in the view because we define a user here
    @user = user
    # The mail method takes a subject key, whose value is the email subject line
    mail to: user.email, subject: "Account activation"
  end


  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
  def password_reset
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end