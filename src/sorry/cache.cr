require "file_utils"

require "./config"

class Cache
  def file_exists?(filename)
  end

  def add_file(path, filename = nil)
  end

  def get_url(filename)
  end
end

class LocalCache < Cache
  def initialize
    @cache_path = "cache/"
    @local_cache_path = "public/cache/"
  end

  def file_exists?(filename)
    File.exists?(@local_cache_path + filename)
  end

  def add_file(path, filename = nil)
    FileUtils.cp path, @local_cache_path
  end

  def get_url(filename)
    "/" + @cache_path + filename
  end
end
