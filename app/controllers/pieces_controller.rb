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
    @piece_version.piece_id = @piece.id
    @piece_version.piece_img = params[:picture]
    @piece_version.save
    redirect_to "/users/" + session[:user].to_s
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
