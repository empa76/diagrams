class Share < ActiveRecord::Base
  belongs_to :diagram
  belongs_to :user
end
