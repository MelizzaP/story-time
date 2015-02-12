class TalesController < ApplicationController
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
    tale = Tale.create
  end

  def edit
  end

  def destroy
  end
  
end
