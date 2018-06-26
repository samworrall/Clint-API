class Event < ApplicationRecord
  def self.search(params = {})
    events = params[:date].present? ? Event.find_by(date: params[:date]) : Event.all
  end
end
