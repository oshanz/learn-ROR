require 'rubygems'
require 'vips'
include VIPS

class ImageController < ApplicationController

  def create
    uploader = ImageUploader.new
    uploader.store!(params[:image])
    Image.new(uploader.current_path).write("app/assets/images/#{uploader.filename}")
    Image.new(uploader.current_path)
      .shrink(2)
      .write("app/assets/images/2-#{uploader.filename}")
    Image.new(uploader.current_path)
      .shrink(4)
      .write("app/assets/images/4-#{uploader.filename}")
    Image.new(uploader.current_path)
      .shrink(6)
      .write("app/assets/images/6-#{uploader.filename}")
    session[:image] = uploader.filename
    VIPS::thread_shutdown
    redirect_to :back
  end
end
