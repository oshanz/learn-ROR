require 'rubygems'
require 'vips'
include VIPS

class ImageProcessor

  # yep this can be sepearte to 3 jobs
  def processImg(current_path,filename)
    Image.new(current_path).write("app/assets/images/#{filename}")
    Image.new(current_path)
      .shrink(2)
      .write("app/assets/images/2-#{filename}")
    Image.new(current_path)
      .shrink(4)
      .write("app/assets/images/4-#{filename}")
    Image.new(current_path)
      .shrink(6)
      .write("app/assets/images/6-#{filename}")
    VIPS::thread_shutdown
  end

end
