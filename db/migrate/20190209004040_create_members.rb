class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :name
      t.string :email
      t.boolean :open
      t.string :token
      t.references :campaign, foreign_key: true

      t.timestamps
    end
  end
end
