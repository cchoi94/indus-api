class HomeController < ApplicationController
  # autheticate_user is a resource that can be used on any method to make sure client is authorized
  before_action :authenticate_user, only: [:auth]

  # Public method
  def index
    render json: { service: 'auth-api', status: 200, }
  end

  def auth
    render json: { status: 200, msg: "You are currently Logged-in as #{current_user.username}"}
  end

end
