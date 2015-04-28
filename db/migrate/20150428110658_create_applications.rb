class CreateApplications < ActiveRecord::Migration
  def change
    create_table :applications do |t|
      t.integer :job_id
      t.string :email
      t.string :name
      t.string :tel
      t.text :answer
      t.string :video

      t.timestamps null: false
    end
  end
end
