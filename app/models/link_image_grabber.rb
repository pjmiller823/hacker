class LinkImageGrabber
  def initialize(story)
    @story = story
  end

  def process
    if @story.image
      puts "failing"
      p @story.image
      return
    end

    # Use the open-uri method to suck down the contents of the link
    page_source = open(@story.link)
    puts "downloaded the src"
    # use nokogiri to parse the HTML we downloaded into an object we can ask questions of
    page_content = Nokogiri::HTML(page_source)
    puts "parse the page content"
    # Gimme the first <img> tag
    image_from_the_page = page_content.css("img").select.first
    puts "got image from page"
    unless image_from_the_page
      return
    end

    # From that img tag, gimme the src attribute
    src_attribute = image_from_the_page.attribute("src")
    puts "got src of img"
    unless src_attribute
      return
    end

    # Download that image content and put it in the image
    @story.image = open(src_attribute.value)
    @story.save
    puts "downladed image."
  rescue MiniMagick::Error, Errno::ENOENT
    puts "Not gonna process this image"
  end
end
