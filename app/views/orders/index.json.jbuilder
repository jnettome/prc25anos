json.array!(@orders) do |order|
  json.extract! order, :id, :name, :email, :code, :pagseguro_code, :status
  json.url order_url(order, format: :json)
end
