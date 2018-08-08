class BlogsController < ApplicationController

  before_action :blog_id, only: [:show, :edit, :update, :destroy]
  before_action :go_to_login, only: [:show, :edit, :update, :destroy]

  def index
    if logged_in?
      @blogs = Blog.all
    else
      redirect_to new_session_path
    end
  end

  def top
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to blogs_path, notice: 'ブログを作成しました。'
    else
      render 'new'
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end


  def new
    if logged_in?
      @blog = Blog. new
    else
      redirect_to new_session_path
    end
  end

  def show
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path ,notice: 'ブログを編集しました'
    else
      render 'edit'
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path
  end

  private
  def blog_params
    params.require(:blog).permit(:name,:content)
  end

  def blog_id
    @blog = Blog.find(params[:id])
  end

end
