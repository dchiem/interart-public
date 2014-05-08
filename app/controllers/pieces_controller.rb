class PiecesController < ApplicationController
  def new
  end

  def submit
    @piece = Piece.new
    @piece.title = params[:title]
    @piece.user_id = session[:user]
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

  def show
    @piece = Piece.find(params[:id])
  end

  def annotate
    @piece_version = PieceVersion.find(params[:id])
  end

  def tag
    pieces = Piece.get_for_tag(params[:tag])
    render :partial => "pieces/piece_grid", :locals => {:pieces => pieces}
  end
end
