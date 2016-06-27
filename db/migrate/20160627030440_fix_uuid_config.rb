class FixUuidConfig < ActiveRecord::Migration
  def change
    remove_column :field_data, :fieldable_id
    remove_column :forms, :formable_id
    add_column :field_data, :fieldable_id, :uuid
    add_column :forms, :formable_id, :uuid
  end
end
