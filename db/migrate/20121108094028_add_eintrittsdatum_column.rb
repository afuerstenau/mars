class AddEintrittsdatumColumn < ActiveRecord::Migration
  def up
    add_column :members, :eintrittsdatum, :date
    add_column :members, :austrittsdatum, :date
  end

  def down
    remove_column :members, :eintrittsdatum
    remove_column :members, :austrittsdatum
  end
end
