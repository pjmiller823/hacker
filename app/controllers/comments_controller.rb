class CommentsController < ApplicationController
  def create
    @story = Story.find(params[:story_id])
    @comment = @story.comments.create(comment_params)
    @comment.save
    redirect_to story_path(@story)

  end

private
  def comment_params
    params.require(:comment).permit(:name, :body)
  end
end
