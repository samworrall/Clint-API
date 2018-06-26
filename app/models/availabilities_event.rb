class AvailabilitiesEvent < ApplicationRecord
  belongs_to :availability
  belongs_to :event
end
