class DealsController < ApplicationController

  def index
    sort_id = params[:sort_id].blank? ? Sort.first.id : params[:sort_id]
    @deals = Deal.where(sort_id: sort_id).page(params[:page]).per(9)
  end

  def show
    @deal = Deal.find(params[:id])
  end

end
