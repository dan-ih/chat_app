class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "ChatChannel"
  end

  def speak(data)
    message = {
      message: data["message"],
      sender_id: cookies.signed[:user_id] = current_user.id if current_user
      timestamp: Time.now.strftime("%H:%M:%S") # Format: HH:MM:SS
    }

    ActionCable.server.broadcast("chat_channel", message)

  end
end

