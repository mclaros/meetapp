class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :username, :limit => 15, :null => false
      t.string :full_name, :null => false
      t.string :bio, :limit => 500
      t.date :date_of_birth
      t.string :email
      t.string :location

      t.timestamps
    end
  end
end
