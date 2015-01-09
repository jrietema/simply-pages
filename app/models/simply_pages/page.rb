module SimplyPages
  class Page < ActiveRecord::Base

    acts_as_nested_set

    default_scope       -> { order 'position ASC'}
    scope :published, -> {}

  end
end
