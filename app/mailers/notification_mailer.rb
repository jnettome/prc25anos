class NotificationMailer < ActionMailer::Base
  default from: "no-reply@prc25anos.com.br"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.order_created.subject
  #
  def order_created(email_address, order)
    @order = order

    mail to: email_address, subject: '[PRC25ANOS] Seu pedido de adesão foi criado'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification.order_updated.subject
  #
  def order_updated(email_address, order)
    @order = order

    mail to: email_address, subject: '[PRC25ANOS] O status de sua adesão foi atualizado'
  end
end