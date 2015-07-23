require 'rails_helper'

RSpec.describe "logs/index", type: :view do
  before(:each) do
    assign(:logs, [
      Log.create!(
        :meal => "Meal",
        :food => "MyText"
      ),
      Log.create!(
        :meal => "Meal",
        :food => "MyText"
      )
    ])
  end

  it "renders a list of logs" do
    render
    assert_select "tr>td", :text => "Meal".to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
