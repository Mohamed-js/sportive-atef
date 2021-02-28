class VotesController < ApplicationController
  # POST /votes or /votes.json
  def vote_up
    u = User.find(session[:current_user]['id'])
    id = params[:id]
    @vote = Vote.where(['user_id = ? AND article_id = ?', (session[:current_user]['id']).to_s, id.to_s])

    if @vote.empty?
      @vote = u.votes.build(article_id: id)
      redirect_to request.referrer if @vote.save
    else
      redirect_to articles_path
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def vote_params
    params.require(:vote).permit(:article_id)
  end
end
