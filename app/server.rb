require 'sinatra/base'
require 'sinatra/partial'
require 'em-websocket'

require_relative 'controllers/app'
require_relative 'lib/game'

EventMachine.run do
  class RockPaperScissorsLizardSpock < Sinatra::Base
    register Sinatra::Partial
    enable :sessions
    enable :method_override
    set :partial_template_engine, :erb
    set :root, File.dirname(__FILE__)
    set :views, proc { File.join(root, 'views') }
    set :public_folder, proc { File.join(root, '..', 'public') }

    @clients = []     



    EM::WebSocket.start(host: '0.0.0.0', port: '3001') do |ws|
      ws.onopen do |handshake|
        @clients << ws
        ws.send "Connected to #{handshake.path}."
      end
      
      ws.onclose do 
        ws.send "Closed."
        @clients.delete ws
      end  

      ws.onmessage do |msg|
        puts "Received Message: #{msg}"
        @clients.each do |socket|
          socket.send msg    
        end
      end
    end

    RockPaperScissorsLizardSpock.run! port: 3000
  end
end  


