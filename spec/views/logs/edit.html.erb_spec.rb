require 'rails_helper'

RSpec.describe "logs/edit", type: :view do
  before(:each) do
    @log = assign(:log, Log.create!(
      :meal => "MyString",
      :food => "MyText"
    ))
  end

  it "renders the edit log form" do
    render

    assert_select "form[action=?][method=?]", log_path(@log), "post" do

      assert_select "input#log_meal[name=?]", "log[meal]"

      assert_select "textarea#log_food[name=?]", "log[food]"
    end
  end
end
