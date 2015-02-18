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
    UserTale.create({:user_id => current_user.id, :tale_id => tale.id })
    params[:tale][:user_id].each do |id|
      UserTale.create({ :tale_id => tale.id, :user_id => id.to_i })
    end
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
