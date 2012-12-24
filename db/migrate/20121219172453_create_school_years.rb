class CreateSchoolYears < ActiveRecord::Migration
  def change
    create_table :school_years do |t|
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
