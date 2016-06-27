class FieldsFieldData < ActiveRecord::Migration
  def change
    rename_table :fields_field_data, :field_data_fields
  end
end
