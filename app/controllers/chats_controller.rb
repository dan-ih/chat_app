class ChatsController < ApplicationController
  def show
    @anycable_id = params[:anycable_id] || "1" # Default to "1" if not provided
  end
end

