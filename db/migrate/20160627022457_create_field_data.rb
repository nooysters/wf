class CreateFieldData < ActiveRecord::Migration
  def change
    create_table :field_data do |t|
      t.references :fieldable, polymorphic: true, index: true
      t.string :value
      t.timestamps null: false
    end

    create_table :fields_field_data, id: false do |t|
      t.integer :field_datum_id
      t.integer :field_id
    end

    add_index :fields_field_data, :field_datum_id
    add_index :fields_field_data, :field_id
  end
end
