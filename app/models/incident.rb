class Incident < ApplicationRecord
  STATES = { open: 0, monitoring: 1, resolved: 2, closed: 3 }
  serialize :meta
  enum state: STATES

  has_many :updates
  belongs_to :type, class_name: 'IncidentType'

  before_validation :set_default
  after_create :add_initial_update

  def record_action(actions, comment: nil)
    self.updates.create!(change: {}, actions: actions, comment: comment)
  end

  def add_update(change: {}, actions: [], comment: nil)
    self.assign_attributes(change)
    if self.valid?
      update = self.updates.create!(change: self.changes.map { |k, v| [k, v[1]] }.to_h, actions: actions, comment: comment)
      self.save!
      update
    else
      false
    end
  end

  def type_name
    type ? type.name : 'Incident'.freeze
  end

  def open?
    !self.closed?
  end

  def monitoring?
    self.state == 'monitoring'
  end

  def resolved?
    self.state == 'resolved' || closed?
  end

  def self.closed?
    self.state == 'closed'
  end

  private def set_default
    self.meta ||= {}

    if self.state_changed?
      if self.state == 'open'
        self.happened_at = (self.created_at || Time.zone.now).change(sec: 0)
      end
      resolved_states = %w(resolved closed)
      if !resolved_states.include?(self.state_was) && resolved_states.include?(self.state)
        self.resolved_at = Time.zone.now.change(sec: 0)
      end
    end
  end

  private def add_initial_update
    self.updates.create!(change: self.attributes)
  end
end
