class User < ActiveRecord::Base

  def authenticate(inputed_value)
    #fail
    inputed_value == password
    #BCrypt::Password.new(password_digest) == unencrypted_password
  end
end
