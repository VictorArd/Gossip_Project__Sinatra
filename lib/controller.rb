require 'gossip'

class ApplicationController < Sinatra::Base

  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end

  get '/gossips/new/' do
    erb :new_gossip
  end

  post '/gossips/new/' do
      Gossip.new(params["gossip_author"], params["gossip_content"]).save
      #puts "gossip_author : #{params["gossip_author"]}"
      #puts "gossip_content : #{params["gossip_content"]}"
      redirect '/'
  end

  get '/gossips/:id' do
		@id =  params['id'].to_i
    erb :gossips, locals: {gossip_id: @id}
	end

end