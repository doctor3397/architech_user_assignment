# Please create a simple web based application allowing users to register an account with only a
# username and password.
# Please verify that:
# • The username field accepts alpha-numeric values only
# • The username length is no less than 5 characters
# • The username is not already registered
# • The password has a minimum length of 8 characters and contains at least 1 number, 1
# uppercase, and 1 lowercase character
# • The user gets feedback when the username or the password doesn't meet the criteria
# • Upon submission of a valid username and password, they are persisted to a database
# • The user gets feedback that he/she has been registered
# Please note within this exercise you do not need to address user authentication or
# authorization, and passwords may be stored in plain text.

class User < ApplicationRecord
  has_secure_password

  VALID_USER_REGEX = /\A[A-Za-z0-9]+\z/i
  validates :username, presence: true, format: { with: VALID_USER_REGEX,
    message: "must be alpha-numeric."}, length: { minimum: 5 },  uniqueness: true

  VALID_PASSWORD_REGEX = /\A(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])[a-zA-Z0-9]+\z/i
  validates :password, length: {minimum: 8}, format: { with: VALID_PASSWORD_REGEX, message: "must contain at least 1 number, 1 uppercase, and 1 lowercase character"}

end
