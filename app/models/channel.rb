class Channel < ApplicationRecord
  serialize :params

  validate :valid_receiver

  delegate :notify, to: :receiver

  def receiver
    receiver_class.new(**(params || {}))
  end
  
  def receiver_class
    ChannelReceivers.const_get(self.receiver_name.camelize).tap do |klass|
      raise TypeError unless klass < ChannelReceivers::Base
    end
  end

  private

  def valid_receiver
    begin
      receiver
    rescue NameError, TypeError => e
      errors.add(:receiver_name, "must be exist #{e.inspect}")
    end
  end
end
