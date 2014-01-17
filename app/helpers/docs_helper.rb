module DocsHelper
  def extension_image(file)
    ext = File.extname(file)
    case ext
    when /docx?/
      "/assets/word.png"
    when /xlsx?/
      "/assets/excel.png"
    else
      "/assets/word.png"
    end
end
end
