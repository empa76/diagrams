require 'rails_helper'

RSpec.describe Diagram, type: :model do
  it { should validate_presence_of(:name) }
end
