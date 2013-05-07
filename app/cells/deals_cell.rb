class DealsCell < Cell::Rails

  def list
    @deals = Deal.page(params[:page]).per(4)
    render
  end

  def recommended_deals
    @recommended_deals = Deal.page(params[:page]).limit(12)
    render
  end

  def item(deal)
    @deal = deal
    render
  end

end
