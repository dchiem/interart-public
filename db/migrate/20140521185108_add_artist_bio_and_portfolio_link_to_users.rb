class AddArtistBioAndPortfolioLinkToUsers < ActiveRecord::Migration
  def change
    add_column :users, :artist_bio, :text
    add_column :users, :portfolio_link, :string
  end
end
