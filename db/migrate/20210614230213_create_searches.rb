class CreateSearches < ActiveRecord::Migration[6.1]
  def change
    create_table :searches do |t|
      t.string :request
      t.string :action
      t.string :params
      t.json :payload

      t.timestamps
    end
  end
end
