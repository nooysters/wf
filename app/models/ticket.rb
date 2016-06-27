class Ticket < ActiveRecord::Base
  has_one :form, as: :formable
  has_many :field_data, as: :fieldable

  validates :title, presence: true
  validates :form, presence: true
end
