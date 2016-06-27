class FormResource < JSONAPI::Resource
  has_one :formable, polymorphic: true
end
