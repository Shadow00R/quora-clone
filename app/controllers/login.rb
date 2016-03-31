enable :sessions
helpers SessionHelper

get '/login' do
	erb :"static/login"
end

post '/login' do 
	@user = User.authenticate(params[:email],params[:password])
	if @user
		session[:user_id] = @user.id
		redirect to '/' # may cause error
	else
		@message = "Login failed. Email or password invalid"
		erb :"static/login"
	end
end

post '/logout' do 
	if logged_in?
		session[:user_id] = nil
		redirect '/' # cross reference with line 12
	end
end
