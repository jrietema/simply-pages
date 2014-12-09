class SimplyPages::File < ActiveRecord::Base

  IMAGE_MIMETYPES = %w(gif jpeg pjpeg png tiff).collect{|subtype| "image/#{subtype}"}

  attr_accessor :dimensions

  has_attached_file :media,
                    styles: lambda {|f| (f.instance.dimensions.blank?? { } : { original: f.instance.dimensions }).merge(
                                              thumb: '80x60#',
                                              resized: '640x480'
                                          )},
                    path: ':rails_root/public/assets/:class/:id/:basename.:style.:extension',
                    url: '/assets/:class/:id/:basename.:style.:extension'

  validates_attachment_presence :media
  validates :media_file_name,
            presence: true

  do_not_validate_attachment_file_type :media

  default_scope       -> { order 'title ASC'}
  scope :images,      -> { where(:media_content_type => IMAGE_MIMETYPES) }
  scope :not_images,  -> { where('media_content_type NOT IN (?)', IMAGE_MIMETYPES) }

  def is_image?
    IMAGE_MIMETYPES.include?(media_content_type)
  end

  # File/FileGroup compatibility method
  def folder?
    false
  end

  def label
    title
  end

end
