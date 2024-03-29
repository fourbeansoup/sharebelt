class SessionsController < Clearance::SessionsController
  def new
    redirect_to :root
  end

  def create_from_omniauth
    auth_hash = request.env["omniauth.auth"]

    authentication = Authentication.find_by_provider_and_uid(auth_hash["provider"], auth_hash["uid"]) || Authentication.create_with_omniauth(auth_hash)
    if authentication.user
      user = authentication.user
      authentication.update_token(auth_hash)
      @notice = "Signed in!"
    else
      user = User.create_with_auth_and_hash(authentication,auth_hash)
      @notice = "User created - confirm or edit details..."
    end
    session[:auth_id] = authentication.id
    sign_in(user)
    redirect_to sites_url, :notice => @notice
  end

end
