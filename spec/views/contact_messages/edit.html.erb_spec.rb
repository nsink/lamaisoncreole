require 'spec_helper'

describe "contact_messages/edit" do
  before(:each) do
    @contact_message = assign(:contact_message, stub_model(ContactMessage,
      :nom => "MyText",
      :email => "MyText",
      :telephone => "MyText",
      :message => "MyText"
    ))
  end

  it "renders the edit contact_message form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => contact_messages_path(@contact_message), :method => "post" do
      assert_select "textarea#contact_message_nom", :name => "contact_message[nom]"
      assert_select "textarea#contact_message_email", :name => "contact_message[email]"
      assert_select "textarea#contact_message_telephone", :name => "contact_message[telephone]"
      assert_select "textarea#contact_message_message", :name => "contact_message[message]"
    end
  end
end
