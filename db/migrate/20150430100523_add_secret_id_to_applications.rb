class AddSecretIdToApplications < ActiveRecord::Migration
  def change
    add_column :applications, :secret_id, :string
  end
end
