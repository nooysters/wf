class AddUuidToTicket < ActiveRecord::Migration
  def change
    drop_table :tickets

    create_table :tickets, id: :uuid, default: "uuid_generate_v4()", force: true do |t|
      t.string :title
      t.text :description
      t.timestamps
    end
  end
end
