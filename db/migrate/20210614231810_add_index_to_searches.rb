class AddIndexToSearches < ActiveRecord::Migration[6.1]
  def change
    add_index :searches, %i[request action params], unique: true
    add_index :searches, :payload, using: :gin
  end
end
