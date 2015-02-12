class TalesController < ApplicationController
  def index
    @tales = Tale.all
    render json: @tales, status: 200
  end

  def create
  end

  def edit
  end

  def show
  end

  def new
  end

  def destroy
  end
end
