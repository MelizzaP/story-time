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
  end
  
  def create
    tale = Tale.new(tale_params)
    tale.owner_id = current_user.id
    tale.save
    redirect_to tales_path
  end

  def edit
  end

  def destroy
  end
 
 private
  def tale_params
    params.require(:tale).permit(:public_access, :story_type, :title, :content, :inspiration) 
  end
end
