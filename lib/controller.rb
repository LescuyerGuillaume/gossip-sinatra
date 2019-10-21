require 'bundler'
require 'gossip'
Bundler.require

class ApplicationController < Sinatra::Base
	get '/' do
		erb :index, locals: {gossips: Gossip.all}
	end

	get '/gossips/new/' do
		erb :new_gossip
	end

	post '/gossips/new/' do
	  Gossip.new(params["gossip_author"], params["gossip_content"]).save
	  redirect '/'
	end

#L'id entrée par l'utilisateur et le potin correspondant (trouvé grâce à find) sont envoyé à l'erb show
	get '/gossips/:id' do
		erb :show, locals: {id: params["id"], single_gossip: Gossip.find(params["id"])}		
	end

#L'id entrée par l'utilisateur et le potin correspondant (trouvé grâce à find) sont envoyé à l'erb edit
	get '/gossips/:id/edit' do
		erb :edit, locals: {id: params["id"], single_gossip: Gossip.find(params["id"])}		
	end

#L'id et les infos entrées par l'utilisateur sont envoyées à la méthode update
	post '/gossips/:id/edit' do
	 Gossip.update(params["new_author"], params["new_content"], params["id"])
	 redirect '/'
	end
end	