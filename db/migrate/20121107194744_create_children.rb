class CreateChildren < ActiveRecord::Migration
  def change
    create_table :children do |t|
      t.integer :member_id
      t.string :last_name
      t.string :first_name
      t.string :klasse_bei_eintritt

      t.timestamps
    end
  end
end
