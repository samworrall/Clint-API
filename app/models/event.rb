class Event < ApplicationRecord
  has_and_belongs_to_many :availabilities

  def self.search(params = {})
    @events = []
    @date = Availability.find_by(date: params[:date])
    @av_events = AvailabilitiesEvent.where(availability_id: @date.id)
    @av_events.each { |av_event| @events << Event.find_by(id: av_event.event_id) }
    params[:date].present? ? @events : Event.all
  end
end
