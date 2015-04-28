class AddDetailsToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :contact, :string
    add_column :businesses, :tel, :string
  end
end
