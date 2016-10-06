class AddFieldIdToFieldData < ActiveRecord::Migration
  def change
    add_column :field_data, :field_id, :integer
  end
end
