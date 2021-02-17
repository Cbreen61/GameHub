class PlatformsController < ApplicationController
    before_action :require_login
    before_action :find_platform, only: [:index, :show, :edit, :update, :destroy]
    


    def index
        @platforms = @current_user.platforms.all
    end
    def show
        if find_platform
            render :show
        else
           platform_not_found
        end
    end

    def new
        @user = User.find_by(params[:user_id])
        @platform = @user.platforms.new

    end

    def create
        params
        @platform = Platform.new(platform_params)
        if @platform.save 
            redirect_to platforms_path
        else
            flash.now[:error] = @platform.errors.full_messages
            render :new
        end
    end

    def edit
        if platform_user

        else
            flash[:notice] = "You can only edit platforms you add."
            redirect_to platform_path(@platform)
        end


    end
    
    def update
        if @platform.update(platform_params)
            redirect_to platform_path(@platform)
        else
            flash.now[:error] = @platform.errors.full_messages
            render :edit
        end
        
    end

    def destroy
        find_platform

        if platform_user
            @platform.destroy
            flash[:notice] = "#{@platform.name} was deleted."
            redirect_to platforms_path
        else
            flash[:notice] = "Only users that create platforms can delete them"
            redirect_to platform_path(@platform)
        end

    end



    private
    def find_platform
        @platform = Platform.find_by_id(params[:id])
    end

    def platform_params
        params.require(:platform).permit(:name, :manufacturer, :user_id, :image)
    end
    def platform_user
        @platform.user == current_user   
    end

    def platform_not_found
        flash[:notice] = "Platform does not exist"
        redirect_to platforms_path
    end

end

