class DropFields < ActiveRecord::Migration
  def change
    drop_table :fields
  end
end
