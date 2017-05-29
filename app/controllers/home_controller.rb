class HomeController < ApplicationController
  def index
        @every_post=Post.all.order("id desc")
  end

  def new
       
  end

  def show
    @one_post = Post.find(params[:post_id])
    #@comments=Comment.where("post_id" => params[:id])
    @comments= @one_post.comments
  end

  def edit
    @one_post = Post.find(params[:post_id])
  end
  
  def create
        @apple=params[:title]
        
        @grape=params[:content]
        
        @jelly =params[:mynum1]
        
        
        new_post= Post.new
        new_post.title=@apple
        new_post.content=@grape
        new_post.mynum1=@jelly
        new_post.save
        
        redirect_to "/"
  end
  
  def update
        @one_post = Post.find(params[:post_id])
        @one_post.title=params[:title]
        @one_post.content=params[:content]
        @one_post.mynum1=params[:mynum1]
        @one_post.save
        
        redirect_to action: "show", id: @one_post
  end
  
  def destroy
    @one_post = Post.find(params[:post_id])
    #@one_post = Post.find(params[:post_id])
    @one_post.destroy
    
    redirect_to "/"
  end
  
  def comment
    comment=Comment.new
    comment.body=params[:body]
    comment.post_id=params[:post_id]
    comment.save
    
    #redirect_to "home/show"+params[:id] 
    redirect_to :back
  end

end
