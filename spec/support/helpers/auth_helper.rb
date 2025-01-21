require 'devise/jwt/test_helpers'

module TestHelpers
  module AuthHelper
    def provide_auth_headers(user)
      headers = { 'Accept' => 'application/json', 'Content-type' => 'application/json' }
      auth_headers = Devise::JWT::TestHelpers.auth_headers(headers, user)
    end
  end
end
