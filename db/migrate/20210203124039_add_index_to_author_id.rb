class AddIndexToAuthorId < ActiveRecord::Migration[6.1]
  def change
    add_index :logs, :author_id
  end
end
