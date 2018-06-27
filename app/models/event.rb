class Event < ApplicationRecord
  has_and_belongs_to_many :availabilities

  def self.search(params = {})
    params[:date].present? ? Event.sort_by_date(params) : Event.all
  end

  def self.sort_by_date(params)
    @events = []
    @date = Availability.find_by(date: params[:date])
    @av_events = AvailabilitiesEvent.where(availability_id: @date.id)
    @av_events.each { |av_event| @events << Event.find_by(id: av_event.event_id) }
    @events
  end
end
