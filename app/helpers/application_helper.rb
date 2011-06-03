module ApplicationHelper
  
  def display_flash
    flash_markup = ''
    flash.each do |name, msg|
      flash_markup << content_tag(:div, msg, :id => "flash_#{name}", :class => "flash_message") if msg.is_a?(String)
    end
    flash_markup.html_safe
  end
  
end
