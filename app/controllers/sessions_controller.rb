class SessionsController < ApplicationController

  def create
    user = User.find_or_create_by!(user_hash)
    session[:user_id] = user.id

    redirect_to root_path, notice: 'Signed in sucessfully'
  end

  private

  def auth_hash
    request.env['omniauth.auth']
  end

  def user_hash
    {
      name:     auth_hash.info.name,
      uid:      auth_hash.uid,
      provider: auth_hash.provider,
    }
  end
end
