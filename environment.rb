class AppName < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
  end
  set :root, File.dirname(__FILE__)

  register Sinatra::AssetPack

  assets {
    serve '/js',     from: 'assets/js'
    serve '/css',    from: 'assets/css'
    serve '/img',    from: 'assets/images'

    js :app, [
      '/js/vendor/jquery-2.0.2.min.js',
      '/js/vendor/**/*.js',
      '/js/vendor/*.js',
      '/js/lib/**/*.js',
      '/js/lib/*.js'
    ]

    css :application, '/css/application.css', [
      '/css/screen.css',
      '/css/vendor/*.css',
      '/css/vendor/**/*.css'
    ]

    js_compression  :jsmin 
    css_compression :simple
  }
end
