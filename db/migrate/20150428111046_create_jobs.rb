class CreateJobs < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :business_id
      t.string :secret_id

      t.timestamps null: false
    end
  end
end
