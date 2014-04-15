class ContentController < ApplicationController
  def home
  end

  def return
  end

  def panel
    @notification = OrderNotification.find_by_code(params[:code])
    @order = @notification.order
  end
end
