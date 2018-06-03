require 'rails_helper'

RSpec.describe "registered_apps/show", type: :view do
  before(:each) do
    @registered_app = assign(:registered_app, RegisteredApp.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
