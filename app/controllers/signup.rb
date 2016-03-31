enable :sessions 

get '/signup' do 
	erb :"static/signup"
end

post '/signup' do
	@user = User.new(params[:user])
	if @user.save
		session[:user_id] = @user.id 
		redirect to '/'
	else 
		erb :"static/signup"
	end
end