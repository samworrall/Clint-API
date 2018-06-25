class Event
  include Mongoid::Document

  field :title, type: String
  field :description, type: String
  field :price, type: Integer
  field :date, type: String

  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :date, presence: true

  index({ title: 'text' })
  index({ isbn:1 }, { unique: true, name: "isbn_index" })
end
