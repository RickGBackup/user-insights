require 'rails_helper'

RSpec.describe "registered_apps/new", type: :view do
  before(:each) do
    assign(:registered_app, RegisteredApp.new())
  end

  it "renders new registered_app form" do
    render

    assert_select "form[action=?][method=?]", registered_apps_path, "post" do
    end
  end
end
