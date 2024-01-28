# typed: true

class Api::UsersController < ApplicationController
  before_action :authenticate_api_user!

  def get_user
    @user = User.find_by(uid: params["uid"])
    return render status: "404", json: "User not found" if !@user

    render status: "200", json: @user.as_json(only: [:id, :name, :email, :image])
  rescue Exception => e
    render status: "500", json: { message: "Internal Server Error" }
  end
end
