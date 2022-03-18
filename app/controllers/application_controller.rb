require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
    redirect "/articles"
  end

  # index
  get "/articles" do
    @articles = Article.all
    erb :index
  end

  # CREATE pt. 1
  get "/articles/new" do
    @article = Article.new
    erb :new
  end

  # CREATE pt. 2
  post "/articles" do
    @article = Article.create(params)
    redirect "/articles/#{@article.id}"
  end

  # READ
  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  # UPDATE pt. 1
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  # UPDATE pt. 2
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect "/articles/#{ @article.id }"
  end

  # DELETE
  delete "/articles/:id" do
    Article.destroy(params[:id])
    redirect "/articles"
  end
end
