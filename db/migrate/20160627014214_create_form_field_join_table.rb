class CreateFormFieldJoinTable < ActiveRecord::Migration
  def change
    create_table :form_fields, id: false do |t|
      t.integer :form_id
      t.integer :field_id
    end

    add_index :form_fields, :form_id
    add_index :form_fields, :field_id
  end
end
