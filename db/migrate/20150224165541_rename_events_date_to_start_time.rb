class RenameEventsDateToStartTime < ActiveRecord::Migration
  def change
    rename_column :events, :date, :start_time
  end
end
