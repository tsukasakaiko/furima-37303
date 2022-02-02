class CreateItemAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :item_addresses do |t|

      t.timestamps
    end
  end
end
