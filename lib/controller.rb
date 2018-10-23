require 'gossip'

class ApplicationController < Sinatra::Base
    get '/' do
        erb :index, locals: {gossips: Gossip.all}   #locals, permet d'insérer dans notre fichier ERB des variables que l'on utilisera dans la vue
    end

    get '/gossips/new/' do
        erb :new_gossip 
    end

    post '/gossips/new/' do     # reagit au Submit
        Gossip.new(params["gossip_author"],params["gossip_content"]).save
        redirect '/'  #redirige vers la page d'accueil
    end

    get '/gossips/:gossip_id' do |n| #identifiant du gossip
        puts "Gossip id: #{n}"  
        erb :gossip_page, locals: {id: n}
    end
end