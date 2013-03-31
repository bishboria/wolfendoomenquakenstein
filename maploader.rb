class MapLoader
  def self.load(filename)
    lines  = File.readlines(filename).map { |line| line.chomp }
    width  = lines[0].size
    height = lines.size
    Array.new(width) do |x|
      Array.new(height) do |y|
        lines[y][x]
      end
    end
  end
end
