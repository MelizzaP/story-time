class TalesController < ApplicationController
  def index
    @tales = Tale.all
    render json: @tales, status: 200
  end

  def show
    @tale = Tale.find(params[:id])
    render json: @tale, status: 200
  end
  
  def new
    @tale = Tale.new
  end
  
  def create
  end

  def edit
  end

  def destroy
  end
  
end
