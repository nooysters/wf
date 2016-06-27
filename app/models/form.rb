class Form < ActiveRecord::Base
  belongs_to :formable, polymorphic: true
  has_and_belongs_to_many :fields
end
