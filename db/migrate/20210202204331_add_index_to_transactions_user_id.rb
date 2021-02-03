class AddIndexToTransactionsUserId < ActiveRecord::Migration[6.1]
  def change
    add_index :transactions, :author_id
  end
end
