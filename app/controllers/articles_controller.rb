class ArticlesController < ApplicationController
  before_action :set_article, only: %i[show edit update destroy]
  before_action :verify_user

  # GET /articles or /articles.json
  def index
    @categories = Category.all_asc
    @random_article = Article.random
    @top_article = Vote.top_art
  end

  # GET /articles/1 or /articles/1.json
  def show
    @id = params[:id]
    @votee = exist?
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # POST /articles or /articles.json
  def create
    u = User.find(session[:current_user]['id'])
    @article = u.articles.build(article_params)

    respond_to do |format|
      if @article.save
        format.html { redirect_to articles_path, notice: 'Article was successfully created.' }
        format.json { render :show, status: :created, location: articles_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to @article, notice: 'Article was successfully updated.' }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy
    respond_to do |format|
      format.html { redirect_to articles_url, notice: 'Article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_article
    @article = Article.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def article_params
    params.require(:article).permit(:title, :text, :image, :author_id, :category_id)
  end

  def verify_user
    redirect_to root_path if session[:current_user].nil?
  end

  def exist?
    Vote.where(['user_id = ? AND article_id = ?', (session[:current_user]['id']).to_s, @id.to_s])
  end
end
