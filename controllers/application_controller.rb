class AppName < Sinatra::Base
  get '/' do
    haml :index
  end
end
