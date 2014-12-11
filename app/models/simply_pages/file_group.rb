class SimplyPages::FileGroup < ActiveRecord::Base

  acts_as_nested_set counter_cache: :children_count

  has_many :files

  # File/FileGroup compatibility method
  def folder?
    true
  end

  def is_image?
    false
  end

  def parent_title
    parent.nil? ? '' : parent.title
  end
end