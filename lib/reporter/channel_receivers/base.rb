module ChannelReceivers
  class Base
    include Rails.application.routes.url_helpers

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

    def url_options
      Rails.application.config.channel_receiver_default_url_options || {}
    end

    private

    def notify_update(update)
      raise NotImplementedError
    end
  end
end
