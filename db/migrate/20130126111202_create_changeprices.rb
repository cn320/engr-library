class CreateChangeprices < ActiveRecord::Migration
  def change
    create_table :changeprices do |t|
      t.string :type
      t.integer :checkoutdate
      t.float :price

    end
  end
end
