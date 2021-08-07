class CsvChannel < ApplicationCable::Channel
  def subscribed    
    stream_from "csv_#{current_user.id}"
    ActionCable.server.broadcast("csv_#{current_user.id}", { body: "Websocket open." })
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
