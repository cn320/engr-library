class CreateAdminlists < ActiveRecord::Migration
  def change
    create_table :adminlists do |t|
      t.string :username
      t.string :password


    end
  end
end
