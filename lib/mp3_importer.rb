# parse filenames and send to Song class
# path attribute upon initialization
# 2 methods - files, import

class MP3Importer
  attr_accessor :path, :files

  def initialize(path)
    @path = path
  end

  def files
    # only wants .mp3 files
    file = Dir.entries(@path)
    file.find_all do |m|
      m if m.include?(".mp3")
    end
  end

  def import
    files.each do |filename|
      Song.new_by_filename(filename)
    end
  end
end

