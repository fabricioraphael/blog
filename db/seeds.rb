# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

# Post.destroy_all
# User.destroy_all
# Comentario.destroy_all
# Profile.destroy_all


user = User.create(:email => 'fabricioraphael.b@gmail.com', :password => '123456')
user.role = "admin"
user.save!

profile = Profile.create(:nome => "Fabricio Raphael", :nascimento => "09/11/1991", :endereco => "QND 60 casa 05", :web_site => "www.google.com.br",
                          :bio => "Computer programmer")

user.profile = profile

Categoria.create [{:nome => 'Programação'},
                  {:nome => 'Eventos'},
                  {:nome => 'Novidades'},
                  {:nome => 'Musicas'},
                  {:nome => 'Random'}]