class DropCurrencies < ActiveRecord::Migration[6.0]
  def change
    drop_table :currencies
  end
end
