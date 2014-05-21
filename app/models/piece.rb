class Piece < ActiveRecord::Base
  belongs_to :user
  has_many :piece_versions
  has_many :comments, :through => :piece_versions
  has_and_belongs_to_many :tags
  belongs_to :category
  
  def self.get_for_tag(tag)
    if tag == ""
      return Piece.all
    end
    results = {}
    Piece.all.each do |p|
      p.tags.each do |t|
        if t.name == tag
          results[p] = 1
        end
      end
    end
    return results.keys
  end

  def url
    if piece_versions.length > 0
      piece_versions.last.url
    else
      ""
    end
  end

  def set_tags(tags)
    tags.gsub(/\s+/, "").split(",").each do |tag|
      t = Tag.find_by_name(tag)
      if t == nil
        t = Tag.create(:name => tag)
      end
      t.pieces.push(self)
    end
  end
end
