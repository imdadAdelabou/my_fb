class UsersController < ApplicationController
    before_action :set_id, only: [:show]
    skip_before_action :login_required, only: [:new, :create]
    def new
        @user = User.new
    end

    def create
        @user = User.new(get_params)
        if @user.save
            redirect_to user_path(@user.id)
        else
            render :new
        end
    end

    def show
        @user = User.find(params[:id])
    end
    private
    def get_params
        params.require(:user).permit(:name, :surname, :email, :password, :password_confirmation)
    end
    def set_id
        @user = User.find(params[:id])
    end
end
