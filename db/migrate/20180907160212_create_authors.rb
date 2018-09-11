class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    drop_table :authors
    create_table :authors do |t|
      t.string :name
      t.string :email
      t.integer :article_count

      t.timestamps
    end
  end
end
