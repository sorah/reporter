class Incident < ApplicationRecord
  STATES = { open: 0, monitoring: 1, resolved: 2, closed: 3 }
  serialize :meta
  enum state: STATES

  has_many :updates

  before_save :set_default

  def record_action(actions, comment: nil)
    self.updates.create!(change: {}, actions: actions, comment: comment)
  end

  def add_update(change: {}, actions: [], comment: nil)
    self.assign_attributes(change)
    if self.valid?
      self.updates.create!(change: self.changes.map { |k, v| [k, v[1]] }.to_h, actions: actions, comment: comment)
      self.save!
    else
      false
    end
  end

  private def set_default
    self.meta ||= {}
  end
end
