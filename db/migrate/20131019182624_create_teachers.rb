class CreateTeachers < ActiveRecord::Migration
  def change
    create_table :teachers do |t|
      t.string :name
      t.string :email
      t.string :group

      t.timestamps
    end
  end
end
