class CreateComentarios < ActiveRecord::Migration
  def self.up
    create_table :comentarios do |t|
      t.integer :post_id
      t.text :corpo

      t.timestamps
    end
  end

  def self.down
    drop_table :comentarios
  end
end
