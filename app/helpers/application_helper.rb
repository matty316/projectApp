module ApplicationHelper
  def title(title)
    if title.empty?
      "Look at what I just bought!"
    else
      "Look at what I just bought! - #{title}"
    end
  end
end
