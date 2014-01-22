module DocsHelper
  def extension_image(file)
    ext = File.extname(file)
    case ext
    when /docx?/
      "/images/word.png"
    when /xlsx?/
      "/images/excel.png"
    else
      "/images/word.png"
    end
end
end
