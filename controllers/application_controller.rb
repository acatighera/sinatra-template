class Hokusai < Sinatra::Base
  #TODO remove this
  include Twitter::Autolink

  get '/' do
    @subscriptions = Subscription.all
    haml :index
  end

  get '/import_searches' do 
    Twitter.saved_searches.each do |saved_search|
      Subscription.create(:twitter_id => saved_search[:id], :last_synced => Time.now, :query => saved_search[:query], :name => saved_search[:name]) unless Subscription.find_by_twitter_id(saved_search[:id])
    end
    redirect to('/')
  end

  get '/ch/:id' do
    @subscription = Subscription.find(params[:id])
    @tweets = Twitter.search(@subscription.query, :count => 10, :result_type => "recent").results
    haml :channel, :layout => false
  end
end
