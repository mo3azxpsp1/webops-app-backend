class UsersController < ApplicationController

  before_action :set_user, only: [:show, :update, :destroy]

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  def create_session
    @user = User.find_by email: params[:email]

    if @user && @user.authenticate(params[:password])
      render json: response_obj(@user), status: :ok
    else
      render json: {message: 'Invalid email/password'}, status: :unauthorized
    end
  end

  private

def response_obj(user)
    { 
      # auth_token: JWT.encode({user_id: user.id}),
      email: user.email,
      first_name: user.first_name,
      last_name: user.last_name
    }
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
    end
end
