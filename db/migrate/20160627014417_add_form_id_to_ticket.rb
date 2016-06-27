class AddFormIdToTicket < ActiveRecord::Migration
  def change
    add_reference :forms, :imageable, polymorphic: true, index: true
  end
end
