class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]
  skip_before_filter :verify_authenticity_token, only: :notify

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
  end

  # POST /orders/notify
  def notify
    @notification = PagseguroClient::Notification.retrieve(params[:notificationCode])

    @order = Order.find(@notification.order_id)

    qr_code_img = RQRCode::QRCode.new(@notification.code, :size => 4, :level => :h ).to_img

    @order.order_notifications.create!(
      code: @notification.code, status: @notification.status, payment_method: @notification.payment_method,
      client: "#{@notification.sender.name} - #{@notification.sender.email} (#{@notification.sender.phone.area_code} #{@notification.sender.phone.number})",
      address: qr_code_img.to_string)

    NotificationMailer.order_updated(@order.email, @order).deliver

    render nothing: true
  end


  # GET /orders/new
  def new
    @order = Order.new
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        NotificationMailer.order_created(@order.email, @order).deliver

        format.html { redirect_to PagseguroClient::payment_url(@order.code) }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /orders/1
  # PATCH/PUT /orders/1.json
  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:name, :email, :code, :pagseguro_code, :status)
    end
end
