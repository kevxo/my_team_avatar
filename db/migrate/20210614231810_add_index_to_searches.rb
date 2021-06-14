class AddIndexToSearches < ActiveRecord::Migration[6.1]
  def change
    add_index :searches, %i[request action], unique: true
  end
end
