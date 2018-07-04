class AddReplying < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :replied_id, :integer
    add_column :comments, :replied_type, :string
  end

    add_index :comments, [:replied_type, :replied_id]
end
