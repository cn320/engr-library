class CreateUserlists < ActiveRecord::Migration
  def change
    create_table :userlists do |t|
      t.integer :stucolid
      t.string :name
      t.string :surname
      t.integer :status

    end
  end
end
