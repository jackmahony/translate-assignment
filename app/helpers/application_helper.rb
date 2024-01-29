module ApplicationHelper
    def locale_link(locale)
        url_for(params.permit(:locale).merge(locale: locale))
    end
end
