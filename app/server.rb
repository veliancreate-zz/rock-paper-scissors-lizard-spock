require 'sinatra/base'
require 'sinatra/partial'

require_relative 'controllers/app'
require_relative 'lib/game'

class RockPaperScissorsLizardSpock < Sinatra::Base
  register Sinatra::Partial
  enable :sessions
  enable :method_override
  set :partial_template_engine, :erb

  set :root, File.dirname(__FILE__)
  set :views, proc { File.join(root, 'views') }
  set :public_folder, proc { File.join(root, '..', 'public') }
end
