+++
# Hero widget.
widget = "hero"  # See https://sourcethemes.com/academic/docs/page-builder/
headless = true  # This file represents a page section.
active = true  # Activate this widget? true/false
weight = 5

title = " "

# Hero image (optional). Enter filename of an image in the `static/media/` folder.
hero_media = ""

[design.background]
  # Apply a background color, gradient, or image.
  #   Uncomment (by removing `#`) an option to apply it.
  #   Choose a light or dark text color by setting `text_color_light`.
  #   Any HTML color name or Hex value is valid.

  # Background color.
  # color = "navy"
  
  # Background gradient.
  gradient_start = "#4bb4e3"
  gradient_end = "#2b94c3"
  
  # Background image.
   image = "confocal.tif.jpg"  # Name of image in `static/media/`.
    image_darken = 0.2  # Darken the image? Range 0-1 where 0 is transparent and 1 is opaque.
    image_size = "cover"  #  Options are `cover` (default), `contain`, or `actual` size.
    image_position = "center"  # Options include `left`, `center` (default), or `right`.
    image_parallax = true  # Use a fun parallax-like fixed background effect? true/false
  
  # Text color (true=light or false=dark).
  text_color_light = false

# Call to action links (optional).
#   Display link(s) by specifying a URL and label below. Icon is optional for `[cta]`.
#   Remove a link/note by deleting a cta/note block.
[cta]
  url = "https://lokraj.shinyapps.io/TCID50_Calculator/"
  label = "TCID50 Calculator"
  icon_pack = "fas"
  icon = "calculator"

[cta_alt]
  url = "https://lokraj.shinyapps.io/TCID50_Calculator/"
  label = "An easy to use online tool for calculating TCID50 (beta version)"



+++



