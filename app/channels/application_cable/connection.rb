module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verfied_user
    end

    protected

    def find_verfied_user
      user = env['warden'].user
      return user if user.present?
      reject_unauthorized_connection
    end
  end
end
