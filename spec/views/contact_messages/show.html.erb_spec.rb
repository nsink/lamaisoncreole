require 'spec_helper'

describe "contact_messages/show" do
  before(:each) do
    @contact_message = assign(:contact_message, stub_model(ContactMessage,
      :nom => "MyText",
      :email => "MyText",
      :telephone => "MyText",
      :message => "MyText"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
    rendered.should match(/MyText/)
  end
end
