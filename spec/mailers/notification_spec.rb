require "spec_helper"

describe NotificationMailer do
  describe "order_created" do
    let(:mail) { NotificationMailer.order_created }

    it "renders the headers" do
      mail.subject.should eq("Order created")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

  describe "order_updated" do
    let(:mail) { NotificationMailer.order_updated }

    it "renders the headers" do
      mail.subject.should eq("Order updated")
      mail.to.should eq(["to@example.org"])
      mail.from.should eq(["from@example.com"])
    end

    it "renders the body" do
      mail.body.encoded.should match("Hi")
    end
  end

end
