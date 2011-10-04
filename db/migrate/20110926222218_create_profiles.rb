class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.integer :user_id
      t.string :nome
      t.date :nascimento
      t.string :endereco
      t.integer :telefone
      t.string :empresa
      t.string :web_site
      t.text :bio

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
