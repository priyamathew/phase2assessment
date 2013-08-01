get '/event/create' do
  erb :create_event
end

post '/event/create' do 
  params[:event][:user_id] = current_user.id
  @event = Event.create(params[:event])
  if request.xhr?
    erb :event, layout: false
  else
    redirect "/event/#{@event.id}"
  end
end

post '/event/:event_id/edit' do 
  @event = Event.find(params[:event_id])
  @event.update_attributes(params[:event])
  redirect "/event/#{@event.id}"
end

get '/event/:event_id' do
  @event = Event.find(params[:event_id])

  erb :event
end

post '/event/:event_id/delete' do
  @event = Event.find(params[:event_id])
  @event.destroy

  redirect "/user/#{current_user.id}/profile"
end
