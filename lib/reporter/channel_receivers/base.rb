module ChannelReceivers
  class Base
    def initialize
    end

    def notify(something)
      case something
      when Update
        notify_update something
      else
        raise TypeError, "unsupported notification for #{something.class}"
      end
    end

    private

    def notify_update(update)
      raise NotImplementedError
    end
  end
end
