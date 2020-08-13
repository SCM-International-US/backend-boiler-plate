class User < ActiveRecord::Base
  include ActiveModel::Validations
  has_secure_password

  validates :password, presence: true, length: {minimum: 6}
  validates :password_confirmation, presence: true
  before_save :create_session_token

  validate :password_requirements_are_met

  def self.create_user!(params)
    create!(params)
  end

  def password_requirements_are_met
    rules = {
      ' must contain at least one lowercase letter' => /[a-z]+/,
      ' must contain at least one uppercase letter' => /[A-Z]+/,
      ' must contain at least one digit' => /\d+/,
      ' must contain at least one special character' => /[^A-Za-z0-9]+/
    }
    unless password.nil?
      rules.each do |message, regex|
        errors.add(:password, message) unless password.match(regex)
      end
    end
    end
end
