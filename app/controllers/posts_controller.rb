class PostsController < ApplicationController
  def new
  	@post = Post.new
  end

  def index
    @posts = Post.all.order("created_at DESC").paginate(page: params[:page], per_page: 9)

    respond_to do |format|
        format.html 
        format.json {render json: @posts}
    end
  end

  def show
    @post = Post.find(params[:id])
  end

	def create
    @post = Post.new(permit_post)

    if @post.save
      respond_to do |format|
        format.html { redirect_to root_url}
        format.json {render json: @post}
      end
    end
  end

  def about
  end
  
  def getDetail
    @post = Post.find(params[:getD]) # file_name is the data key of Ajax request in view

    respond_to do |format|
      format.html
      format.json { render json: @post }
    end
  end

  def threemissing
    @posts = Post.where(:status => 'Lost').limit(3);
    respond_to do |format|
        format.json {render json: @posts}
    end
  end

  def threefound
    @posts = Post.where(:status => 'Found').limit(3);
    respond_to do |format|
        format.json {render json: @posts}
    end
  end

  def getallmissing
    @posts = Post.where(:status => 'Lost');
    respond_to do |format|
        format.json {render json: @posts}
    end
  end

  def getallfound
    @posts = Post.where(:status => 'Found');
    respond_to do |format|
        format.json {render json: @posts}
    end
  end



	private
		def permit_post
			params.require(:post).permit(:status,:requestdate,:place,:city,:relation,:gender,:mentalstatus,:age,:name,:fathername,:clothes,:clothescolor,:description,:image)
		end
end