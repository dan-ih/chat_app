module ApplicationCable
  class Connection < ActionCable::Connection::Base
    rescue_from StandardError, with: :report_error

    private
      def report_error(e)
         Rails.logger.error  ">>> ERROR: #{e.message}\n#{e.backtrace.join('\n')}"
      end
  end
end
