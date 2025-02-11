class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_for "ChatChannel"
    stream_for params["room_id"]

  end

  def speak(data)
    # Persist the message if needed
    broadcast_to params["room_id"], message: data["message"]

  end
end

