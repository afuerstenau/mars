class CreateMembershipFees < ActiveRecord::Migration
  def change
    create_table :membership_fees do |t|
      t.integer :member_id
      t.integer :school_year_id
      t.decimal :fee, precision: 8, scale: 2
      t.date :payment_date
      t.string :payment_type

      t.timestamps
    end
  end
end
