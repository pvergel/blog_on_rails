class PostsController < ApplicationController


  # def create
  #   @post = Post.new(post_params)
 
  #   @post.save
  #   redirect_to @post
  # end

  def new
  @post = Post.new
end
 
def create
  @post = Post.new(params[:post].permit(:title, :text))
 
  if @post.save
    redirect_to @post
  else
    render 'new'
  end
end
 



  def show
    @post = Post.find(params[:id])
  end


  def index
    @posts = Post.all
  end


  def edit
    @post = Post.find(params[:id])
  end


  def update
  @post = Post.find(params[:id])
 
  if @post.update(params[:post].permit(:title, :text))
    redirect_to @post
  else
    render 'edit'
  end
end


 def destroy
   @post = Post.find(params[:id])
   @post.destroy
 
   redirect_to posts_path
 end


  private

  def post_params
    # This says that params[:post] is required, but inside that, only params[:post][:title] and params[:post][:body] are permitted
    # Unpermitted params will be stripped out
    params.require(:post).permit(:title, :text)
  end

end

  

