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

end