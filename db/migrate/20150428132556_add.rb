class Add < ActiveRecord::Migration
  def change
    add_column :businesses, :status, :string, :default => "active", :allow_null => false
  end
end
