class RepliedType < ActiveRecord::Migration[5.2]
  def change
  	change_column :comments, :replied_type, :string, :default => "Comment"
  end
end
