class CreateMembers < ActiveRecord::Migration
  def change
    create_table :members do |t|
      t.string :first_name
      t.string :last_name
      t.string :phone
      t.string :email
      t.string :street
      t.integer :postcode
      t.decimal :beitrag, precision: 8, scale: 2
      t.string :town

      t.timestamps
    end
  end
end
