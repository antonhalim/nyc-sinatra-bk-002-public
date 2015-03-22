class LandmarksController < ApplicationController
	configure do
	    enable :sessions unless test?
	    set :session_secret, "secret"
	  end

	get '/' do
		erb :index
	end

	get '/landmarks' do
		erb :'landmarks/index'
	end

	get '/new' do
		erb :'landmarks/new'
	end

	post '/new' do
		@landmark = Landmark.create(name: params["landmark"]["name"], year_completed: params["landmark"]["year"])
		session[:id] = @landmark.id
		redirect to '/landmarks/:id'
	end

	get '/landmarks/:id' do
		if session[:id].nil?
			@landmark = Landmark.find(params["id"])
			session[:id] = params["id"]
		else
			@landmark = Landmark.find(session[:id])
		end
		erb :'landmarks/show'
	end

	post '/edit/:id' do
		@landmark = Landmark.find(params[:id])
		@landmark.update(params["landmark"])
		session.clear
		 redirect to ('landmarks')
	end

	get '/edit/:id' do
		@landmark = Landmark.find(session[:id])
		erb :'landmarks/edit'
	end

	get '/exit' do
		"Thank You!"
	end
end
