class Event < ApplicationRecord
  has_and_belongs_to_many :availabilities

  def self.search(params = {})
    Event.params_present(params) ? Event.sort(params) : Event.all
  end

  def self.sort(params)
    @sorted_by_date = Event.sort_by_date(params)
    @sorted_by_date.select { |event|
     (event.location == params[:location] && event.price_range == params[:price_range].to_i)
     }
  end

  def self.sort_by_date(params)
    @date_events = []
    @date = Availability.find_by(date: params[:date])
    @av_date_events = AvailabilitiesEvent.where(availability_id: @date.id)
    @av_date_events.each { |av_event| @date_events << Event.find_by(id: av_event.event_id) }
    @date_events
  end

  def self.params_present(params)
    params[:date].present? || params[:location].present? || params[:price_range].present?
  end
end
