class SimplyPages::FileGroup < ActiveRecord::Base

  acts_as_nested_set counter_cache: :children_count

  has_many :files

  before_destroy :check_for_children

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

  # has no children or file contents
  def empty?
    (children.size == 0) && (files.all.size == 0)
  end

  private

  def check_for_children
    raise StandardError if !empty?
  end
end