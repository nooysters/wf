class RenameImagableToFormable < ActiveRecord::Migration
  def change
    rename_column :forms, :imageable_id, :formable_id
    rename_column :forms, :imageable_type, :formable_type

  end
end
