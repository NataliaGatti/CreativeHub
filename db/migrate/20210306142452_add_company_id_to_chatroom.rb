class AddCompanyIdToChatroom < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :company, index: true
    # add_column :chatrooms, :company_id, :int
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
