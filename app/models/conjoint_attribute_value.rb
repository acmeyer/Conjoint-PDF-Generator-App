class ConjointAttributeValue < ActiveRecord::Base
  belongs_to :conjoint_attribute

  has_attached_file :image, 
                    styles: { medium: "300x300>", thumb: "100x100>" },
                    storage: :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/

  def s3_credentials
    {bucket: "YOUR_BUCKET_NAME", :access_key_id => 'YOUR_AWS_ACCESS_KEY_ID', :secret_access_key => 'YOUR_AWS_ACCESS_KEY'}
  end
end
