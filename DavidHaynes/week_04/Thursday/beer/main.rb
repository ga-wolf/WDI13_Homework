require "sinatra"
require "sinatra/reloader"
require "sqlite3"
require "pry"

get '/' do
    erb :home
end


#index
get '/beer' do
    @beer = query "SELECT * FROM beer"
    erb :beer_index
end

post '/beer' do
    this_query = "INSERT INTO beer (name, country, class, image) VALUES ('#{params['name']}','#{params['country']}','#{params['class']}','#{params['image']}')"
    query this_query
    redirect '/beer'
end

get '/beer/new' do

    erb :beer_new
end

get '/beer/:id' do
    @this_beer = query "SELECT * FROM beer WHERE id=#{ params['id']}"
    erb :beer_show
end

get '/beer/:id/delete' do
    query "DELETE FROM beer WHERE id=#{ params['id'] }"
    redirect '/beer'
end

get '/beer/:id/edit' do
    @this_beer = query "SELECT * FROM beer WHERE id=#{ params['id']}"
    erb :beer_edit
end

post '/beer/:id/edit' do
    query "UPDATE beer SET name='#{ params['name']}', country='#{ params['country'] }', class='#{ params['class'] }', image='#{ params['image'] }' WHERE id='#{ params['id'] }' "
    redirect '/beer'
end

def query sql
    db = SQLite3::Database.new 'database.db'
    db.results_as_hash = true

    puts sql

    result = db.execute sql
    db.close
    result
end
