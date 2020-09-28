require './environment'

module FormsLab
  class App < Sinatra::Base

    get '/' do
      erb :root
    end

    get '/new' do
      erb :'pirates/new'
    end

    post '/pirates' do
      @pirates = Pirate.new(params[:pirates])

      params[:pirates][:ships].each do |details|
        Ship.new(details)
      end

      @ships = Ships.all

      erb :'pirates/show'
    end
    #
    # get '/pirates/:id' do
    #   @pirates = Pirates.all
    #   binding.pry
    # end
    #
    # post '/pirates' do
    #   erb :show
    # end

  end
end
