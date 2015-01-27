module SimplyPages
  class Page < ActiveRecord::Base

    acts_as_nested_set

    default_scope       -> { order 'position ASC'}
    scope :published, -> {}

    validates :depth,
              numericality: { less_than_or_equal_to: SimplyPages.navigation_depth }

  end
end
