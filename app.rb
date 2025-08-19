require 'sinatra/base'
require_relative 'routes/login_routes'
require_relative 'routes/telecall'
require_relative 'routes/token'

class MainApp < Sinatra:: Base
    use LoginRoutes
    use TeleCall
    use Token

    set :bind, 'localhost'
    set :port, 4567

    set :public_folder, File.dirname(__FILE__)
    get '/' do
        send_file File.join(settings.public_folder, 'index.html')
    end

    run! if app_file == $0
end