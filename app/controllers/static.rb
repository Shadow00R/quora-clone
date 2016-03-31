helpers SessionHelper


get '/' do
	@user = current_user
	@questions = Question.all #.order(updated_at: :desc).paginate(:page => params[:page], :per_page => 5)
  erb :"static/index"
end

get '/single_question' do
	@user = current_user
	erb :'static/single_question'
end

get '/user_profile' do
	@user = current_user
	@answers = Answer.where(user_id: @user.id)
	erb :'static/user_profile'
end

get '/user/:id' do
	erb :'static/user_profile'
end