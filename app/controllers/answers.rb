enable :sessions


get '/questions/:question_id/answers/new' do 
	@user = current_user
	@question = Question.find_by(id: params[:question_id])
	erb :"static/create_answer"
end

post '/questions/:question_id/answers' do 
	@user = current_user
	@question = Question.find_by(id: params[:question_id])
	@answer = Answer.new(params[:asnwer].merge(user_id: @user.id, question_id: @question.id))

	if @answer.save
		redirect '/user_profile'
	else
		erb :"static/create_answer"
	end
end

post '/answers/:id' do 
	@user = current_user
	@question = Question.find_by(id: params[:question_id])
	@answers = Answer.where(question_id: @quesiton.id)

	if @answer.save
		erb :'static/current'
	else
		@anserror = "Can't Post Answer. Sign Up And Make Sure Field Is Not Blank"
		erb :'static/current'
	end
end