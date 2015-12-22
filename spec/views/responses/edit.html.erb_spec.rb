require 'rails_helper'

RSpec.describe "responses/edit", type: :view do
  before(:each) do
    @response = assign(:response, Response.create!(
      :content => "MyText",
      :user => nil,
      :advertisement => nil
    ))
  end

  it "renders the edit response form" do
    render

    assert_select "form[action=?][method=?]", response_path(@response), "post" do

      assert_select "textarea#response_content[name=?]", "response[content]"

      assert_select "input#response_user_id[name=?]", "response[user_id]"

      assert_select "input#response_advertisement_id[name=?]", "response[advertisement_id]"
    end
  end
end
