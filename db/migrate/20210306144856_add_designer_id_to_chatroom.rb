class AddDesignerIdToChatroom < ActiveRecord::Migration[6.1]
  def change
    add_reference :chatrooms, :designer, index: true
    # add_column :chatrooms, :designer_id, :int
    #Ex:- add_column("admin_users", "username", :string, :limit =>25, :after => "email")
  end
end
