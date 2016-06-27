class TicketResource < JSONAPI::Resource
  attributes :title, :description

  has_one :form
  has_many :field_data

  key_type :uuid
end
