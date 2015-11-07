class CommentsController < ApplicationController
	def create
		@post = Post.find(params[:post_id])
		@comment = @post.comments.create!(post_params)
		redirect_to @post
	end

	def destroy
		@comment = Comment.find(params[:id])
		@comment.destroy
		respond_to do |format|
      		format.html { redirect_to post_path(params[:post_id]), notice: 'Comment was successfully destroyed.' }
      		format.json { head :no_content }
    	end
    end

	private
		def post_params
			params.require(:comment).permit(:body)
		end

end
