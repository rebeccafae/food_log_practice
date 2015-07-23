require 'rails_helper'

RSpec.describe "logs/new", type: :view do
  before(:each) do
    assign(:log, Log.new(
      :meal => "MyString",
      :food => "MyText"
    ))
  end

  it "renders new log form" do
    render

    assert_select "form[action=?][method=?]", logs_path, "post" do

      assert_select "input#log_meal[name=?]", "log[meal]"

      assert_select "textarea#log_food[name=?]", "log[food]"
    end
  end
end
