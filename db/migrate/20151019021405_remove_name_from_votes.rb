class RemoveNameFromVotes < ActiveRecord::Migration
  def change
    remove_column :votes, :name, :string
  end
end
