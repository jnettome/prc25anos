# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

Iugu.setAccountID("72c4bc67-f2c6-4dfe-b2bc-2d719d8c5d0b")
Iugu.setTestMode(true)

$ ->
  $('#new_order').on 'submit', (evt) ->
    form = $(@)
    form.find('input:submit').prop('disabled', true)
    Iugu.createPaymentToken this, (data) ->
      if (data.errors)
        console.log(data.errors)
        alert("Erro salvando cartão")
      else
        $("#order_pagseguro_code").val( data.id )
        form.get(0).submit()

      form.find('button').prop('disabled', false)
      # form.submit()
    false