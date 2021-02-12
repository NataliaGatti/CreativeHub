class AddCompanyToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :company, :boolean
  end
end
