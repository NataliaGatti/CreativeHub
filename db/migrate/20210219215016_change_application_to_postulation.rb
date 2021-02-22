class ChangeApplicationToPostulation < ActiveRecord::Migration[6.1]
  def change
    rename_column :reviews, :application_id, :postulation_id
    #Ex:- rename_column("admin_users", "pasword","hashed_pasword")
    #Ex:- change_column("admin_users", "email", :string, :limit =>25)
  end
end
