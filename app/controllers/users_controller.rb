class UsersController < ApplicationController
    def create
        @user = User.new(params[user_params])
        if @user.save
            puts "goood"
        else
            puts "fuck"
        end
    end
    
    private 
    
    def user_params
        params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
end
