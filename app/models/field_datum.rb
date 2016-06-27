class FieldDatum < ActiveRecord::Base
  belongs_to :field
  belongs_to :fieldable, polymorphic: true

  validates :fieldable_id, presence: true
end
