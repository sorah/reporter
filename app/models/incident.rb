class Incident < ApplicationRecord
  STATES = { open: 0, monitoring: 1, resolved: 2, closed: 3 }
  serialize :meta
  enum state: STATES

  before_save :set_default

  private def set_default
    self.meta ||= {}
  end
end
