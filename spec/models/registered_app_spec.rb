require 'rails_helper'

RSpec.describe RegisteredApp, type: :model do
  # associations 
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:events) }
   
  # has unique name and URL
  it { is_expected.to validate_presence_of(:name) }
  it { is_expected.to validate_uniqueness_of(:name) }
  
  it { is_expected.to validate_presence_of(:url) }
  it { is_expected.to validate_uniqueness_of(:url) }
end
