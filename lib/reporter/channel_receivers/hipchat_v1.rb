module ChannelReceivers
  class HipchatV1 < Base
    def initialize(token:, room:, notify: true, color: 'red')
      @token = token
      @room = room
      @notify = notify
      @color = color
    end

    private

    def notify_update(update)
      html = []
      html << "<b>#{update.change['state']}</b>" if update.change['state']
      html << " <a href='#{incident_url(update.incident)}'>#{update.incident.type ? update.incident.type.name : 'Incident'}: #{update.incident.title}</a>"
      html << "<br>#{update.comment}" if update.comment.present?

      hipchat[@room].send('reporter', html.join(' '), color: @color, notify: @notify, message_format: 'html')
    end

    def hipchat
      @hipchat ||= HipChat::Client.new(@token)
    end
  end
end
