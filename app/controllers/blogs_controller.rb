class BlogsController < ApplicationController
  # エラー原因: destroyアクションに@blogにパラメータを格納する処理が抜けていた
  # 修正の意図: Fix add :destroy
  before_action :set_blog, only: [:show, :edit, :update, :destroy]

  def index
    @blogs = Blog.all
  end

  def show; end

  def new
    @blog = Blog.new
  end

  def edit; end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to @blog, notice: 'Blog was successfully created.'
    else
      render :new
    end
  end

  def update
    if @blog.update(blog_params)
      redirect_to @blog, notice: 'Blog was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog.destroy
    redirect_to blogs_url, notice: 'Blog was successfully destroyed.'
  end

  private

  def set_blog
    @blog = Blog.find(params[:id])
  end

  def blog_params
    # エラー原因: permitにcontentが不足していた
    # Fix add (permit(:title) => permit(:title, :content))
    params.require(:blog).permit(:title, :content)
  end
end
