class CategoriesController < ApplicationController
  before_action :verify_user

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.includes(:articles).find(params[:id])
    @articles = @category.articles.includes(:votes).includes(:author).order(created_at: 'DESC')
  end

  # includes(:votes).order(created_at: 'DESC')
  # .where(votes: ["votes.user_id = ?", "#{session[:current_user]["id"]}"])
  # GET /categories/new
  def new
    @category = Category.new
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)

    respond_to do |format|
      if @category.save
        format.html { redirect_to new_category_path, notice: 'Category was successfully created.' }
        format.json { render :show, status: :created, location: new_category_path }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name, :priority)
  end

  def verify_user
    redirect_to root_path if session[:current_user].nil?
  end
end
