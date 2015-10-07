require 'rails_helper'

RSpec.describe Shape, type: :model do
  it { should validate_presence_of(:label) }
  it { should validate_presence_of(:kind) }
  it { should belong_to(:diagram) }
end
