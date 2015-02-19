class TalesController < ApplicationController
  before_action :authenticate_user!, :except => [:index]
  
  def index
    @tales = Tale.all
    @contributions = Tale.find_by_sql('SELECT * FROM tales INNER JOIN user_tales ON tales.id = user_tales.tale_id WHERE user_tales.user_id =' + current_user.id.to_s)
  end

  def show
    @tale = Tale.find(params[:id])
    @user = User.find(@tale.owner_id)
    @contributors =  User.find_by_sql('select name from users inner join user_tales on users.id = user_tales.user_id where user_tales.tale_id =' + @tale.id.to_s)
  end
  
  def new
    @tale = Tale.new
    @users = User.all
  end
  
  def create
    tale = Tale.new(tale_params)
    tale.owner_id = current_user.id
    tale.save
    if(params[:tale][:public_access] == 'false')
      UserTale.create({:user_id => current_user.id, :tale_id => tale.id })
      params[:tale][:user_id].each do |id|
        UserTale.create({ :tale_id => tale.id, :user_id => id.to_i })
      end
    end
    redirect_to tales_path
  end

  def update
    if(params[:complete])
      Tale.complete(params) 
    else
      Tale.update_content(params)
    end
    redirect_to tale_path(params[:tale_id])
  end

  def destroy
  end
 
 private
  def tale_params
    params.require(:tale).permit(:public_access, :story_type, :title, :content, :inspiration) 
  end
end
