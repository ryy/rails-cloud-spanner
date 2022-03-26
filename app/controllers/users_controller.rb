class UsersController < ApplicationController
  def create
    user = User.new(user_params)

    if user.invalid?
      render json: { error: "Invalid error", error_details: user.errors.full_messages }, status: 422 and return
    end

    user.save!

    render json: user, status: 201
  end

  def index
    render json: User.all
  end

  def update
    user = User.find(params[:id])
    user.attributes = user_params

    if user.invalid?
      render json: { error: "Invalid error", error_details: user.errors.full_messages }, status: 422 and return
    end

    user.save!

    render json: user
  end

  def destroy
    User.find(params[:id]).destroy!
  end

  def show
    user = User.find(params[:id])

    render json: user
  end

  private

  def user_params
    params.require(:user).permit(:Name)
  end
end