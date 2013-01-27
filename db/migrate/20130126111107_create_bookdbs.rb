class CreateBookdbs < ActiveRecord::Migration
  #def change
   # create_table :bookdbs do |t|
  #    t.integer :barcode
 #     t.string :name
#      t.string :callnum
#    end
#  end

  def self.up
    create_table :bookdbs do |t|
      t.integer :barcode
      t.string :name
      t.string :callnum

    end
  end

  def self.down
	drop_table :bookdbs
  end
end
