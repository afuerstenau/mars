class CreateBankAccounts < ActiveRecord::Migration
  def change
    create_table :bank_accounts do |t|
      t.integer :member_id
      t.integer :blz, limit: 8
      t.integer :account_number, limit: 10
      t.string :bank_name
      t.string :account_holder

      t.timestamps
    end
  end
end
