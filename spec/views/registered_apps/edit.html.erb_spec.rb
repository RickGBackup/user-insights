require 'rails_helper'

RSpec.describe "registered_apps/edit", type: :view do
  before(:each) do
    @registered_app = assign(:registered_app, RegisteredApp.create!())
  end

  it "renders the edit registered_app form" do
    render

    assert_select "form[action=?][method=?]", registered_app_path(@registered_app), "post" do
    end
  end
end
