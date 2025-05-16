class Issue < Sequel::Model(:comic_issues)
  many_to_one :comic

  def save_image(file)
    filename = SecureRandom.hex(10) + ".png"

    File.open("public/#{filename}", "wb") do |f|
      f.write(file.read)
    end

    self.image_url = filename

    self.save
  end
end
