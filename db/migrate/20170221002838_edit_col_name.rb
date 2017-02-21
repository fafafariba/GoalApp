class EditColName < ActiveRecord::Migration
  def change
    rename_column :goals, :privacy, :visibility
    add_column :goals, :status, :string, default: "Ongoing"
  end
end
