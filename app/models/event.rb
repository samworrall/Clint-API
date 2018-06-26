class Event < ApplicationRecord
  def self.search(params = {})
    events = params[:date].present? ? Event.find_by(date: params[:date]) : Event.all
  end

  has_and_belongs_to_many :availabilities
end
