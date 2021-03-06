class CreatePeople < ActiveRecord::Migration
  def self.up
    create_table :people do |t|
      t.string :first_name
      t.string :surname
      t.date :birthday
      t.integer :age
      t.string :job

      t.timestamps
    end
  end

  def self.down
    drop_table :people
  end
end
