require 'spec_helper'

describe "orders/index" do
  before(:each) do
    assign(:orders, [
      stub_model(Order,
        :name => "Name",
        :email => "Email",
        :code => "Code",
        :pagseguro_code => "Pagseguro Code",
        :status => "Status"
      ),
      stub_model(Order,
        :name => "Name",
        :email => "Email",
        :code => "Code",
        :pagseguro_code => "Pagseguro Code",
        :status => "Status"
      )
    ])
  end

  it "renders a list of orders" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "Code".to_s, :count => 2
    assert_select "tr>td", :text => "Pagseguro Code".to_s, :count => 2
    assert_select "tr>td", :text => "Status".to_s, :count => 2
  end
end
