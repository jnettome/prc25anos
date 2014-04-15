# encoding: utf-8
class Order < ActiveRecord::Base
  validates_presence_of :name, :email

  has_many :order_notifications

  after_create :create_payment_order

  def create_payment_order
    payment = Iugu::Charge.create(token: pagseguro_code, email: email, items:
      [{ description: 'Adesão Paraná Clube 25 anos', quantity: 1, price_cents: 500*100 }],
      payer: { name: name, email: email })

    update_attribute :code, payment.invoice_id
    order_notifications.create!(code: payment.invoice_id, status: payment.message, payment_method: 'credit_card')

    NotificationMailer.order_updated(email, self).deliver
  end
end
