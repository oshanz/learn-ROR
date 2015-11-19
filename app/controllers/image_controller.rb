require 'rubygems'
require 'vips'
include VIPS

class ImageController < ApplicationController

  def create
    uploader = ImageUploader.new
    uploader.store!(params[:image])
    Image.new(uploader.current_path)
      .shrink(2)
      .write("public/#{uploader.store_dir}/2/#{uploader.filename}")
    Image.new(uploader.current_path)
      .shrink(4)
      .write("public/#{uploader.store_dir}/4/#{uploader.filename}")
    Image.new(uploader.current_path)
      .shrink(6)
      .write("public/#{uploader.store_dir}/6/#{uploader.filename}")
    session[:image] = uploader.filename
    redirect_to :back
  end
end
