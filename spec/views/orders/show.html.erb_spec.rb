require 'spec_helper'

describe "orders/show" do
  before(:each) do
    @order = assign(:order, stub_model(Order,
      :name => "Name",
      :email => "Email",
      :code => "Code",
      :pagseguro_code => "Pagseguro Code",
      :status => "Status"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
    rendered.should match(/Email/)
    rendered.should match(/Code/)
    rendered.should match(/Pagseguro Code/)
    rendered.should match(/Status/)
  end
end
