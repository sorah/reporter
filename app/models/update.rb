class Update < ApplicationRecord
  serialize :change
  belongs_to :incident
end
