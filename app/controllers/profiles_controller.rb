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
      if author_params[:password].blank? && author_params[:password_confirmation].blank?
        author_params.delete(:password)
        author_params.delete(:password_confirmation)
      end
      if author_params[:current_password].blank? && !author_params[:password].blank?
        author_params.delete(:current_password)
        author_params.delete(:password_confirmation)
      end
      if author_params[:name].blank?
        author_params.delete(:name)
      end
      if author_params.empty?
        redirect_to profile_path, alert: "Nothing to update"
      elsif author_params[:password].present? && !current_author.valid_password?(author_params[:current_password])
        redirect_to edit_author_registration_path, alert: "Invalid current password"
      elsif current_author.update(author_params)
        bypass_sign_in current_author, scope: :author if author_params[:password].present?
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