class Image < ApplicationRecord
  belongs_to :imagable, :polymorphic => true
  mount_uploader :image, ImageUploader
end
