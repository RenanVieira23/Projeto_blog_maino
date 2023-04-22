class ProfilesController < ApplicationController
    before_action :authenticate_author!
  
    def show
      @author = current_author
    end
  
    def edit
      @author = current_author
    end
  
    def update
      @author = current_author
      if @author.update(author_params)
        redirect_to profile_path, notice: "Profile updated successfully"
      else
        render :edit
      end
    end
  
    private
  
    def author_params
      params.require(:author).permit(:name, :email, :password, :password_confirmation)
    end
  end