module Revily::Client::Authentication

  def token_authenticated?
    !!@auth_token
  end

  
end
