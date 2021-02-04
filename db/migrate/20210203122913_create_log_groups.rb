class CreateLogGroups < ActiveRecord::Migration[6.1]
  def change
    create_table :log_groups do |t|
      t.references :group, null: false, foreign_key: true
      t.references :log, null: false, foreign_key: true

      t.timestamps
    end
  end
end
