require 'rails_helper'

RSpec.describe Share, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:diagram) }
end