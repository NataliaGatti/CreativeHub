class SetUserCompanyDefaulFalse < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :company, :boolean, default: false
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
