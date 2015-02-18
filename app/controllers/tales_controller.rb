class TalesController < ApplicationController
  before_action :authenticate_user!, :except => :index
  
  def index
    @tales = Tale.all
  end

  def show
    @tale = Tale.find(params[:id])
  end
  
  def new
    @tale = Tale.new
    @users = User.all
  end
  
  def create
    tale = Tale.new(tale_params)
    tale.owner_id = current_user.id
    tale.save
    userTale = UserTale.new
    userTale.user_id = current_user.id
    userTale.tale_id = tale.id
    userTale.save
    params[:user_id]
    redirect_to tales_path
  end

  def update
    Tale.update_content(params)
    redirect_to tale_path(params[:tale_id])
  end

  def destroy
  end
 
 private
  def tale_params
    params.require(:tale).permit(:public_access, :story_type, :title, :content, :inspiration) 
  end
end
