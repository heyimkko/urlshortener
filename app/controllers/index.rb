get '/' do
  @urls = Url.all
  erb :index
end

post '/urls' do
  @urls = Url.all
  @url = Url.new :long_url => params[:long_url]
  @url.save
  redirect '/'
end
