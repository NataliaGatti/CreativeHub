class RenameOldTableToNewTable < ActiveRecord::Migration[6.1]
  def change
    rename_table :applications, :postulations
  end
end
