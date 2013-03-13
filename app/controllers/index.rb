get '/' do
  @urls = Url.all
  erb :index
end

post '/urls' do
  @urls = Url.all #TODO: make this order in a sane way
  @url = Url.new :long_url => params[:long_url]
  @url.save
  redirect '/'
end

get '/:short_url' do
  @url = Url.find_by_short_url(params[:short_url])
  @new_count = (@url.click_count + 1)
  @url.update_attribute :click_count, @new_count
  # puts "%%%"* 40
  # @url.update_attributes :click_count, params[:click_count] += 1
  # p "-"*100
  # p params[:click_count] += 1
  redirect "#{@url.long_url}"
end
