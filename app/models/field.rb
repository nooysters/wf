class Field < ActiveRecord::Base
   has_and_belongs_to_many :forms
   has_many :field_datum, through: :field_data_fields

   enum :input_type = {
     text: 0,
     text_area: 1,
     check_box: 2
   }

   validates :input_type, presence: true
end
