class SimplyPages::File < ActiveRecord::Base

  belongs_to :file_group

  # Utilize MIME lib to verify existing mime type
  # NOTE: image/x-ms-bmp is not covered by MIME, but since BMP files
  # parse as this type using the unix file executable (which paperclip uses),
  # we include it separately here to ensure BMP support.
  IMAGE_MIMETYPES = %w(gif bmp jpeg jpeg png tiff).collect do |subtype|
    [ "image/#{subtype}",
      "image/x-#{subtype}",
      "application/#{subtype}",
      "x-application/#{subtype}"
    ].map{|t| MIME::Types[t]}
  end.flatten.compact.map(&:content_type).uniq + ['image/x-ms-bmp']

  has_attached_file :media,
                    styles: lambda {|f| (f.instance.image_dimensions.blank?? { } : { original: f.instance.image_dimensions }).merge(
                                              thumb: SimplyPages.thumbail_image_geometry,
                                              resized: SimplyPages.resized_image_geometry
                                          )},
                    path: ':rails_root/public/assets/:class/:id/:basename.:style.:extension',
                    url: '/assets/:class/:id/:basename.:style.:extension'

  validates_attachment_presence :media
  validates :media_file_name,
            presence: true

  do_not_validate_attachment_file_type :media

  before_save :extract_dimensions
  serialize :image_dimensions
  serialize :resized_dimensions

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

  def empty?
    true
  end

  def label
    title
  end

  def image_dimensions
    format_dimensions(:image_dimensions)
  end

  def resized_dimensions
    format_dimensions(:resized_dimensions)
  end

  private

  def format_dimensions(accessor)
    dim = read_attribute(accessor.to_sym)
    case dim
      when Array
        dim.join('x')
      else
        dim.to_s
    end
  end

  # Retrieve dimensions for image media
  def extract_dimensions
    return unless is_image?
    {original: 'image_dimensions', resized: 'resized_dimensions'}.each_pair do |style, method|
      tempfile = media.queued_for_write[style]
      unless tempfile.nil?
        geometry = Paperclip::Geometry.from_file(tempfile)
        self.send("#{method}=", [geometry.width.to_i, geometry.height.to_i])
      end
    end
  end

end
