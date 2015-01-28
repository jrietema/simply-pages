module SimplyPages
  class Page < ActiveRecord::Base

    acts_as_nested_set

    default_scope       -> { order 'position ASC'}
    scope :published, -> {}
    scope :for_nav, -> (i){ where navigation_type: i.to_i }

    validates :depth,
              numericality: { less_than_or_equal_to: SimplyPages.navigation_depth }

    def navigation_type=(navtype)
      value = case navtype
                when String, Symbol
                  # is it a numeric parameter string?
                  if navtype.to_i.to_s == navtype
                    navtype.to_i
                  else
                    SimplyPages::Page.nav_index(navtype)
                  end
                else
                  navtype.to_i
              end
      write_attribute(:navigation_type, value)
    end

    def self.nav_index(navtype)
      SimplyPages.navigation_types.index(navtype.to_sym) || 0
    end

  end
end
