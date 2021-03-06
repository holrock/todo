class TodoItem < ActiveRecord::Base
  belongs_to :user, :inverse_of => :todo_items
  has_many :todo_tags
  has_many :tags, through: :todo_tags

  validates :text, presence: true

  after_save :manage_tag

  def self.search_by_tag(tag_text)
    unless tag_text.nil?
      joins(:tags).where(tags: {text: tag_text.sub("#", "")})
    else
      all
    end
  end

  private

  def manage_tag
    text = self[:text]
    tags = []
    text.scan(/#[^#\s]+/) do |t|
      t.sub!("#", "")
      tags << Tag.find_or_create_by(text:t)
    end
    self.tags = tags
  end
end
