# encoding: utf-8
class Order < ActiveRecord::Base
  validates_presence_of :name, :email

  after_create :create_pagseguro_order

  def create_pagseguro_order
    pagseguro_order = PagseguroClient::Order.new(id)
    pagseguro_order.add(id: '1', description: 'Adesão Paraná Clube 25 anos', amount: 0.01)
    @response = pagseguro_order.send_request

    update_attribute :code, @response[:code]
  end
end
