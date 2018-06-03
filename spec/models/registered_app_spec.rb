require 'rails_helper'

RSpec.describe RegisteredApp, type: :model do
  
  # belongs to the user
  it { is_expected.to belong_to(:user) }
   
  # has unique name and URL
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_uniqueness_of(:url) }
end
