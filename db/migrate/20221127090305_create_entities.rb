class CreateEntities < ActiveRecord::Migration[7.0]
  def change
    create_table :entities do |t|
      t.string :name
      t.integer :author
      t.decimal :amount
      t.references :author, index: true, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
