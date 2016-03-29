class IncidentType < ApplicationRecord
  serialize :meta
  has_many :incidents
end
