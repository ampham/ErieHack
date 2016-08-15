class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token
  # Callback that generates an activation token and digest before a user is created
  # This will fire as soon as a user signs up, so all users will get them immediately
  # Note that this is a Method Reference; we pass before_create a method, not a block
  before_create :create_activation_digest
  # Callback that lowercases the user's email before it is saved in the database
  # This way, no matter what users type in, our records are consistently all lowercase
	before_save :downcase_email

  # Some rules for what a password should be like
  validates :password, presence: true, length: { minimum: 6 }, allow_nil: true
  has_secure_password

  # Some rules for what a username should be like
	validates :name, presence: true, length: { maximum: 50 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
	validates :email, presence: true, 
		length: { maximum: 255 },
		format: { with: VALID_EMAIL_REGEX }, 
		uniqueness: { case_sensitive: false }

  # Returns the hash digest of a string, which will be a remember token
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Returns a random token.
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  # Remembers a user in the database for use in persistent sessions.
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  # Returns true if the given token matches the digest
  # This method is now for both authenticating sessions AND activating users via 
  # Metaprogramming. Which one is based on the attribute argument passed
  # Using the send method, the argument is interpolated to which one you want
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  # Forgets a user. Use in signing out.
  def forget
    update_attribute(:remember_digest, nil)
  end

  # Activates an account; updates the database to show that a user has activated.
  def activate
    update_columns(activated: true, activated_at: Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

  private

    # Converts email to all lower-case. Used in the before_save callback above
    def downcase_email
      email.downcase!
    end

    # Creates and assigns the activation token and digest. Used in before_create callback
    def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
    end
end
