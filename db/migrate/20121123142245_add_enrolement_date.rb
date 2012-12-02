class AddEnrolementDate < ActiveRecord::Migration
  def up
    add_column :children, :enrolement_date, :date
  end

  def down
    remove_column :children, :enrolement_date
  end
end
