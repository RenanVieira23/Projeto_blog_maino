class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_author!, except: [:index, :show]

  # GET /posts or /posts.json
  def index 
      @posts = Post.all.with_rich_text_description.order(created_at: :desc)
   
  end

  # GET /posts/1 or /posts/1.json
  def show
    @comentarios = @post.comentarios.order(created_at: :desc)
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = Post.new(post_params.except(:tags))
    @post.author = current_author
    create_or_delete_post_tags(@post, params[:post][:tags])

    respond_to do |format|
      if @post.save
        format.html { redirect_to post_url(@post), notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    create_or_delete_post_tags(@post, params[:post][:tags])
    respond_to do |format|
      if @post.update(post_params.except(:tags))
        format.html { redirect_to post_url(@post), notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

# Use callbacks to share common setup or constraints between actions.
def set_post
  @post = Post.find(params[:id])
end

# Permit only a trusted parameter "white list" through.
def create_or_delete_post_tags(post, tags)
  post.taggables.destroy_all
  tags = tags.present? ? tags.strip.split(",") : []
  tags.each do |tag|
    post.tags << Tag.find_or_create_by(name: tag)
  end
end

# Use callbacks to share common setup or constraints between actions.
def set_post
  @post = Post.find(params[:id])
end

# Permit only a trusted parameter "white list" through.
def post_params
  params.require(:post).permit(:title, :description, :name, :tags)
end
end 