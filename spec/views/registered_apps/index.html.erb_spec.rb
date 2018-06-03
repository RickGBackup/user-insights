require 'rails_helper'

RSpec.describe "registered_apps/index", type: :view do
  before(:each) do
    assign(:registered_apps, [
      RegisteredApp.create!(),
      RegisteredApp.create!()
    ])
  end

  it "renders a list of registered_apps" do
    render
  end
end
