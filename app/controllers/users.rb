post '/user/create' do
  @user = User.new(params[:user])
  if @user.save
    session[:current_user] = @user.id
    redirect "/user/#{@user.id}/profile"
  else
    @errors = @user.errors.full_messages

    erb :index
  end
end

post '/user/login' do 
  @user = User.find_by_email(params[:user][:email])
  if @user && @user.authenticate(params[:user][:password])
    session[:current_user] = @user.id
    redirect "/user/#{@user.id}/profile"
  else
    redirect "/"
  end
end

get '/user/:user_id/profile' do
  @user = User.find(params[:user_id])

  if request.xhr?
    erb :profile, layout: false
  else
    erb :profile
  end

end

get '/logout' do  
  session.clear

  redirect '/'
end

