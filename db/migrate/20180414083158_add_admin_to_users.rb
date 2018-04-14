class AddAdminToUsers < ActiveRecord::Migration
  def change
    # add admin column of type users  
    add_column :users, :admin, :boolean, default: false
  end
end
