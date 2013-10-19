class CreateDetentions < ActiveRecord::Migration
  def change
    create_table :detentions do |t|
      t.references :teacher, index: true
      t.references :student, index: true
      t.set_for :date
      t.string :time
      t.string :reason
      t.integer :points
      t.integer :parent_detention
      t.string :status
      t.text :additional_notes

      t.timestamps
    end
  end
end
