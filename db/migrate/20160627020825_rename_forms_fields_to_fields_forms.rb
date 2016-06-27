class RenameFormsFieldsToFieldsForms < ActiveRecord::Migration
  def change
    rename_table :form_fields, :fields_forms
  end
end
