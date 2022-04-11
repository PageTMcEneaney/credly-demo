
class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to @user
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    if @user.update(user_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to root_path, status: :see_other
  end

# user = User.new(id: 1, name: "Page", description: "app creator", thumbnail: "https://avatars.githubusercontent.com/u/53319614?s=400&u=9fd57e4b5146de1510b0660a9d027aa41809a0d4&v=4", resourceURI: 'www.github.com')

  private
  def user_params
    params.require(:user).permit(:id, :name, :description, :thumbnail, :resourceURI)
  end
end
