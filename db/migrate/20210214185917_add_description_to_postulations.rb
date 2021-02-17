class AddDescriptionToPostulations < ActiveRecord::Migration[6.1]
  def change
    add_column :postulations, :description, :text
  end
end
