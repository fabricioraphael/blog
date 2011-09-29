class CreateCategoria < ActiveRecord::Migration
  def self.up
    create_table :categoria do |t|
      t.string :nome

      t.timestamps
    end
  end

  def self.down
    drop_table :categoria
  end
end
