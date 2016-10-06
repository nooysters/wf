class FormResource < JSONAPI::Resource
  attribute :id
  attributes :formable_id

  has_one :formable, polymorphic: true
  has_many :fields
end
