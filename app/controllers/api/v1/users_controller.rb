class Api::V1::UsersController < Api::V1::BaseController
  skip_before_action :verify_authenticity_token
  before_action :set_user, only: [:show, :update]

  def show
  end

  def create
    @user = User.new(user_params)
    if @user.save
      render :show, status: :created
    else
      render_error
    end
  end

  def update
    if @user.update(user_params)
      render :show
    else
      render_error
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.permit(:id, :name, :photo, :wechat_id, :description, :latitude, :longitude)
  end

  def render_error
    render json: { errors: @user.errors.full_messages },
      status: :unprocessable_entity
  end
end
