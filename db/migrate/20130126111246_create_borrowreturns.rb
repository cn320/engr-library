class CreateBorrowreturns < ActiveRecord::Migration
  def change
    create_table :borrowreturns do |t|
      t.integer :barcode
      t.string :name
      t.datetime :dateborrow
      t.datetime :dateend
      t.float :price

    end
  end
end
