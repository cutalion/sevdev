# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def show_flash
    f_names = [:notice, :warning, :message]
    fl = "<script>Event.observe(window, 'load', function() {"

    for name in f_names
      if flash[name]
        #fl = fl + "<div class=\"#{name}\">#{flash[name]}<div>"
        fl << "Growl.Smoke({text: '#{flash[name]}'});"
      end

      flash[name] = nil;
    end
    fl << "});</script>"

    return fl
  end
end
