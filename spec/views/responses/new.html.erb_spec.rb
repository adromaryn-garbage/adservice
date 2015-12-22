require 'rails_helper'

RSpec.describe "responses/new", type: :view do
  before(:each) do
    assign(:response, Response.new(
      :content => "MyText",
      :user => nil,
      :advertisement => nil
    ))
  end

  it "renders new response form" do
    render

    assert_select "form[action=?][method=?]", responses_path, "post" do

      assert_select "textarea#response_content[name=?]", "response[content]"

      assert_select "input#response_user_id[name=?]", "response[user_id]"

      assert_select "input#response_advertisement_id[name=?]", "response[advertisement_id]"
    end
  end
end
