class CreatePostsCategorias < ActiveRecord::Migration
  def self.up
    create_table :posts_categorias, :id => false do |t|
      t.references :post
      t.references :categoria
    end
  end

  def self.down
    drop_table :posts_categorias
  end
end
