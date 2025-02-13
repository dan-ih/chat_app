module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :sender_id

    def connect
      self.sender_id = cookies.signed[:user_id] || SecureRandom.hex(4)
    end
  end
end

