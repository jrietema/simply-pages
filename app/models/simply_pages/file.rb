class SimplyPages::File < ActiveRecord::Base

  IMAGE_MIMETYPES = %w(gif jpeg pjpeg png tiff).collect{|subtype| "image/#{subtype}"}

  has_attached_file :file,
                    styles: { thumb: '80x60#', resized: '640x480' },
                    path: ':rails_root/public/assets/:class/:id/:basename.:style.:extension',
                    url: '/assets/sites/:class/:id/:basename.:style.:extension'

  validates_attachment_presence :file
  validates :file_file_name

  default_scope       -> { order 'title ASC'}
  scope :images,      -> { where(:file_content_type => IMAGE_MIMETYPES) }
  scope :not_images,  -> { where('file_content_type NOT IN (?)', IMAGE_MIMETYPES) }

  def is_image?
    IMAGE_MIMETYPES.include?(file_content_type)
  end

end
