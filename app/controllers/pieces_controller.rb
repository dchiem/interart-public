class PiecesController < ApplicationController
  def new
  end

  def heart
    @piece = Piece.find(params[:id])
    pl = PieceLike.new
    pl.piece_id = @piece.id
    pl.user_id = session[:user]
    pl.save
  end

  def submit
    @piece = Piece.new
    @piece.title = params[:title]
    @piece.user_id = session[:user]
    @piece.description = params[:description]
    @piece.desired_feedback = params[:desired_feedback]
    @piece.category_id = params[:category_id]
    @piece.save

    @piece.set_tags(params[:tags])
    @piece_version = PieceVersion.new
    @piece_version.version = 1
    @piece_version.piece_id = @piece.id
    @piece_version.piece_img = params[:picture]
    @piece_version.save
    redirect_to "/users/" + session[:user].to_s
  end

  def annotate_submit
    @comment = Comment.new
    @comment.piece_id = params[:piece_id].to_i
    @comment.content = params[:comment]
    @comment.user_id = session[:user].to_i
    @comment.piece_version_id = params[:piece_version_id].to_i
    @comment.save
    redirect_to "/pieces/" + @comment.piece_id.to_s
  end

  def new_piece_version
    @piece = Piece.find(params[:piece_id])
    @piece_version = PieceVersion.new
    @piece_version.piece_img = params[:new_piece_version]
    @piece_version.piece = @piece
    @piece_version.version = @piece.piece_versions.last.version + 1
    @piece_version.save
    redirect_to "/pieces/" + @piece.id.to_s
  end

  def edited
    @comment = Comment.new
    @comment.content = params[:com]
    @comment.piece_version_id = params[:pvid]
    @comment.user_id = session[:user]
    @comment.piece_id = PieceVersion.find(params[:pvid]).piece.id
    @comment.save


    require 'base64'

    data = params[:img]
    # // remove all extras except data
    image_data = Base64.decode64(data['data:image/png;base64,'.length .. -1])
    @comment.set_image(image_data)
    @comment.save
    UserMailer.new_comment(@comment.piece.user, @comment.piece)
    render :text => "OK"
  end

  def show
    @piece = Piece.find(params[:id])
    if @piece.view_count == nil
      @piece.view_count = 1
    else
      @piece.view_count += 1
    end
    
    @piece.save
  end

  def annotate
    @piece_version = PieceVersion.find(params[:id])
    @colors = ["#990000","#ff6666","#ff9999",
      "#ff9900","#ff6600","#ff9933","#ff3300",
      "#ffff33","#ffff99",
      "#336633","#00cc33","#66ff99","#00ff33",
      "#3399ff","#0066cc","#99ccff","#6699cc",
      "#330066","#9900cc","#cc33ff","#cc66ff",
      "#000000", "#888888","#bbbbbb","#ffffff"]
    @thicks = ["small", "medium", "large", "huge"]
  end

  def tag
    if params[:tag]
      pieces = Piece.get_for_tag(params[:tag])
    else
      pieces = Piece.all
    end
    puts '***************************'
    puts params[:category].strip
    @category = params[:category].strip
    if @category == "CATEGORIES"
      
    elsif params[:category]
      pieces = pieces.select{|p| p.category.name == params[:category].strip}
    end

    @tag = params[:tag]

    
    render :partial => "shared/feed", :locals => {:pieces => pieces}
  end
end
