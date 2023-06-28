class PostImagesController < ApplicationController
  #ログインしている状態にのみ以下のアクションが実行される
  before_action :authenticate_user!, only: [:new, :create]

  def new
    @post_image = PostImage.new
  end

  # 投稿データの保存
  def create
    @post_image = PostImage.new(post_image_params)
    @post_image.user_id = current_user.id
    @post_image.save
    redirect_to post_images_path
  end

  def index
    @post_images = PostImage.all
  end

  def show
    @post_image = PostImage.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    post_image = PostImage.find(params[:id])
    post_image.destroy
    #indexにリダイレクト
    redirect_to post_images_path
  end

  #ストロングパラメーター
  private

  def post_image_params
    params.require(:post_image).permit(:shop_name, :image, :caption)
  end

end
