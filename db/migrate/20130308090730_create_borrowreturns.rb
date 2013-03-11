class CreateBorrowreturns < ActiveRecord::Migration
  def change
    create_table :borrowreturns do |t|
      t.integer :studentid
      t.string :bookname
      t.datetime :borrowdate
      t.datetime :duedate
      t.string :bookid
      t.integer :barcode
      t.float :fee

      t.timestamps
    end
  end
end
